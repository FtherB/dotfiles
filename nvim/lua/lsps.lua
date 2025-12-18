require("mason").setup()

require("mason-lspconfig").setup {}

require("blink.cmp").setup({
    keymap = { preset = "default" },
    sources = {
        default = { "lsp", "path","buffer","snippets" },
        per_filetype = {
            markdown = { "dictionary", "lsp", "path" },
            tex = { "lsp", "path", "snippets" },
            plaintex = { "lsp", "path", "snippets" },
            latex = { "lsp", "path", "snippets" },
        },
    },
    signature = {
        enabled = true,
    },
    completion = {
        menu = {
            auto_show = function(ctx, items)
                if not vim.tbl_contains({ "tex", "plaintex", "latex" }, vim.bo.filetype) then
                  return true
                end

                local col = vim.api.nvim_win_get_cursor(0)[2]  -- 0-based
                if col == 0 then
                  return false
                end

                local line = vim.api.nvim_get_current_line()
                local prev_char = line:sub(col, col)

                return prev_char == "\\"
            end,
        },
    },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion = capabilities.textDocument.completion or {}
capabilities.textDocument.completion.completionItem = capabilities.textDocument.completion.completionItem or {}
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = require('mason-lspconfig').get_installed_servers()

vim.lsp.enable(
    servers,
    {
        capabilities = capabilities,
    }
)

--LSP handler
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false })

-- highlight
vim.cmd [[
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
    autocmd!
    autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
    autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]

vim.diagnostic.config({
    virtual_text = true
})
