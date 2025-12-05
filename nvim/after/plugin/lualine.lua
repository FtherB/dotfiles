local function custom_gitdiff()
    vim.api.nvim_set_hl(0, 'MyDiffAdd', { fg = '#00ff00' })
    vim.api.nvim_set_hl(0, 'MyDiffChange', { fg = '#ffff00' })
    vim.api.nvim_set_hl(0, 'MyDiffDelete', { fg = '#ff0000' })
    vim.api.nvim_set_hl(0, 'MyDiffGrey', { fg = '#888888' })

    local gitsigns = vim.b.gitsigns_status_dict
    if not gitsigns then return 'no git' end

    local added = gitsigns.added or 0
    local changed = gitsigns.changed or 0
    local removed = gitsigns.removed or 0


    local result = {}
    if changed > 0 then
        table.insert(result, '%#MyDiffChange#~' .. changed .. '%*')
    elseif changed == 0 then
        table.insert(result, '%#DiffGrey#~0%*')
    end
    if added > 0 then
        table.insert(result, '%#MyDiffAdd#+' .. added .. '%*')
    elseif added == 0 then
        table.insert(result, '%#DiffGrey#+0%*')
    end
    if removed > 0 then
        table.insert(result, '%#MyDiffDelete#-' .. removed .. '%*')
    elseif removed == 0 then
        table.insert(result, '%#DiffGrey#-0%*')
    end

    return table.concat(result, ' ')
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_x = {custom_gitdiff, 'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
