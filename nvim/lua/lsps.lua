require("mason").setup()

require("mason-lspconfig").setup {}

vim.lsp.enable(require('mason-lspconfig').get_installed_servers())

--LSP handler
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {virtual_text = false })

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
