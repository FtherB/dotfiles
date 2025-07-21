require("noice").setup({
    lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
  -- you can enable a preset for easier configuration
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    routes = {
        {
            filter = {
                any = {
                    { event = "msg_show", find = "deprecated" },
                    { event = "lsp", find = "deprecated" },
                    { event = "notify", find = "deprecated" },
                    { event = "msg_show", find = "border chars must be one call" },
                    { event = "lsp", find = "border chars must be one call" },
                    { event = "notify", find = "border chars must be one call" },
                },
            },
            opts = { skip = true },
        },
    },
})


