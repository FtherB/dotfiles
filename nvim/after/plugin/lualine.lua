local function nvimv()
    local title = 'Neovim'
    local vfull = vim.api.nvim_exec2("version", {output = true}).output
    local version = vfull:match("NVIM%s+([^\n]+)")
    return title .. ' ' .. version
end

local function wc()
    local c = vim.fn.wordcount()

    if c.visual_words then
        return string.format("VIS: %d words, %d chars  %d words, %d chars",c.visual_words,c.visual_chars, c.words, c.chars)
    else
        return string.format("%d words, %d chars", c.words, c.chars)
    end
end

local function custom_gitdiff()
    vim.api.nvim_set_hl(0, 'MyDiffAdd', { fg = '#00ff00', italic = true })
    vim.api.nvim_set_hl(0, 'MyDiffChange', { fg = '#ffff00', italic = true })
    vim.api.nvim_set_hl(0, 'MyDiffDelete', { fg = '#ff0000', italic = true })
    vim.api.nvim_set_hl(0, 'MyDiffGrey', { fg = '#888888', italic = true })

    local gitsigns = vim.b.gitsigns_status_dict
    if not gitsigns then return '%#MyDiffGrey#no git%*' end

    local added = gitsigns.added or 0
    local changed = gitsigns.changed or 0
    local removed = gitsigns.removed or 0


    local result = {}
    if changed > 0 then
        table.insert(result, '%#MyDiffChange#~' .. changed .. '%*')
    elseif changed == 0 then
        table.insert(result, '%#MyDiffGrey#~0%*')
    end
    if added > 0 then
        table.insert(result, '%#MyDiffAdd#+' .. added .. '%*')
    elseif added == 0 then
        table.insert(result, '%#MyDiffGrey#+0%*')
    end
    if removed > 0 then
        table.insert(result, '%#MyDiffDelete#-' .. removed .. '%*')
    elseif removed == 0 then
        table.insert(result, '%#MyDiffGrey#-0%*')
    end

    return table.concat(result, ' ')
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {
    },
    lualine_b = {
        {
            'filetype',
            colored = true,
            icon_only = true,
            separator = '',
            padding = {
                left = 1,
                right = 0,
            },
        },
        {
            'encoding',
            separator = '',
            color = {
                gui = 'italic',
            },
            padding = {
                left = 1,
                right = 0,
            },
            fmt = function(str)
                return '(' .. str .. ')'
            end,
        },
        {
            'filename',
            file_status = true,
            newfile_status = true,
            path = 2,
            symbols = {
                modified = '[+]',
                readonly = '[RO]',
                unnamed = '[No Name]',
                newfile = '[New]'
            },
            color = {
                gui = 'italic',
            },
        },
    },
        lualine_c = {},
        lualine_x = {
            {
                wc,
                color = {
                    gui = 'italic'
                },
            },
            {
                'diagnostics',
                color = {
                    gui = 'italic',
                },
            },
            {
                custom_gitdiff,
            },
        },
        lualine_y = {
            {
                'progress',
                color = {
                    gui = 'italic',
                },
            },
        },
        lualine_z = {
            {
                'location',
                color = {
                    gui = 'bold,italic',
                },
            },
        },
    },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
        {
            'filename',
            file_status = true,
            newfile_status = true,
            path = 2,
            color = {
                gui = 'italic',
            },
        },
    },
    lualine_x = {'diagnostics',custom_gitdiff,
        {
            'location',
            color = {
                gui = 'italic',
            },
        },
    },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
      lualine_a = {
          {
              'mode',
              color = {
                  gui = 'bold,italic',
              },
              fmt = function(str)
                  local map = {
                      NORMAL = 'NOR',
                      INSERT = 'INS',
                      VISUAL = 'VIS',
                      ['V-LINE'] = 'V-L',
                      ['V-BLOCK'] = 'V-B',
                      COMMAND = 'CMD',
                      REPLACE = 'REP',
                      TERMINAL = 'TER',
                      SELECT = 'SEL',
                      EX = 'EX ',
                      MORE = 'MOR',
                      CONFIRM = 'CNF',
                  }

                  return map[str] or str
              end,
          },
      },
      lualine_b = {
            {
                nvimv,
                color = {
                    gui = 'italic',
                },
            },
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
