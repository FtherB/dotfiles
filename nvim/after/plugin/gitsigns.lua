require('gitsigns').setup {
  signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signs_staged_enable = true,
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    follow_files = true
  },
  auto_attach = true,
  attach_to_untracked = false,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
    virt_text_priority = 100,
    use_focus = true,
  },
  current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000, -- Disable if file is longer than this (in lines)
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
    on_attach = function(bufnr)
            local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end)

        -- Actions
        map('n', '<leader>gs', gitsigns.stage_hunk)
        map('n', '<leader>gr', gitsigns.reset_hunk)

        map('v', '<leader>gs', function()
          gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end)

        map('v', '<leader>gr', function()
          gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end)

        map('n', '<leader>gS', gitsigns.stage_buffer)
        map('n', '<leader>gR', gitsigns.reset_buffer)
        map('n', '<leader>gp', gitsigns.preview_hunk)
        map('n', '<leader>gi', gitsigns.preview_hunk_inline)

        map('n', '<leader>gb', function()
          gitsigns.blame_line({ full = true })
        end)

        map('n', '<leader>gd', gitsigns.diffthis)

        map('n', '<leader>gD', function()
          gitsigns.diffthis('~')
        end)

        map('n', '<leader>gQ', function() gitsigns.setqflist('all') end)
        map('n', '<leader>gq', gitsigns.setqflist)

        -- Toggles
        map('n', '<leader>gtb', gitsigns.toggle_current_line_blame)
        map('n', '<leader>gtd', gitsigns.toggle_deleted)
        map('n', '<leader>gtw', gitsigns.toggle_word_diff)

        -- Text object
        map({'o', 'x'}, 'ih', gitsigns.select_hunk)
      end
}

local wk = require("which-key")
wk.add({
    { "<leader>gs", desc = "stage_hunk"},
    { "<leader>gr", desc = "reset_hunk"},
    { "<leader>gS", desc = "stage_buffer"},
    { "<leader>gR", desc = "reset_buffer"},
    { "<leader>gp", desc = "preview_hunk"},
    { "<leader>gi", desc = "preview_hunk_inline"},
    { "<leader>gb", desc = "blame_line"},
    { "<leader>gd", desc = "diffthis"},
    { "<leader>gD", desc = "diffthis(~)"},
    { "<leader>gQ", desc = "setqflist(all)"},
    { "<leader>gq", desc = "setqflist"},
    { "<leader>gt", group = "toggle"},
    { "<leader>gtb", desc = "toggle_current_line_blame"},
    { "<leader>gtd", desc = "toggle_deleted"},
    { "<leader>gtw", desc = "toggle_word_diff"},
})
