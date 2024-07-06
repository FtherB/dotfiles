require('nvim-tree').setup({
    sort_by = 'case_sensitive',
    view = {
--         adaptive_size = true,
        width = 35,
        number = true,
        relativenumber = true,
--        mappings = {
--            list = {
--                { key = 'u', action = 'dir_up' },
--            },
--        },
        cursorline = true,
        signcolumn = 'yes',
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
        git_ignored = false,
    },
})

require('nvim-tree.api').tree.toggle({focus = false})
vim.schedule(function() vim.cmd("wincmd l") end )


