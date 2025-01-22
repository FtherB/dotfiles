local format = vim.api.nvim_command_output("echo expand('%:e')")

require('nvim-treesitter.configs').setup{
    auto_install = true,
    highlight = {
        enable = true
    },
    endwise = {
        enable = true,
    },
}
