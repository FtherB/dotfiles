require('nvim-tree').setup({
    sort_by = 'case_sensitive',
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = 'u', action = 'dir_up' },
            },
        },
        cursorline = true,
        signcolumn = 'yes',
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

require("nvim-tree.api").tree.toggle(false,true)
