require("noice").setup({
    messages = {
        enabled = true,
        view = "mini",
        view_error = "popup",
        view_warn = "popup",
        view_history = "split",
    },
    views = {
        notify = {
            border = {
                style = "rounded",
            },
        },
    },
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
                    { event = "msg_show", find = "border chars" },
                    { event = "msg_showerr", find = "border chars" },
                    { event = "notify", find = "border chars" },
                },
            },
            opts = { skip = true },
        },
    },
})

vim.notify = require("noice").notify

-- hide message
local orig_echo = vim.api.nvim_echo
vim.api.nvim_echo = function(msg, history, opts)
  local text = table.concat(vim.tbl_map(function(m) return m[1] end, msg), " ")
  if string.find(text:lower(), "client.is_stopped") then
    return  -- skip deprecated messages
  end
  orig_echo(msg, history, opts)
end
