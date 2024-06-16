local on_attach = function(client, bufnr)

	local set = vim.keymap.set	
	set('n','K','<cmd>lua vim.lsp.buf.hover()<CR>')
	set('n','gf','<cmd>lua vim.lsp.buf.formatting()<CR>')
	set('n','gr','<cmd>lua vim.lsp.buf.references()<CR>')
	set('n','gd','<cmd>lua vim.lsp.buf.definition()<CR>')
	set('n','gD','<cmd>lua vim.lsp.buf.declaration()<CR>')
	set('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>')
	set('n','gt','<cmd>lua vim.lsp.buf.type_definition()<CR>')
	set('n','gn','<cmd>lua vim.lsp.buf.rename()<CR>')
	set('n','ga','<cmd>lua vim.lsp.buf.code_action()<CR>')
	set('n','ge','<cmd>lua vim.diagnostic.open_float()<CR>')
	set('n','g]','<cmd>lua vim.diagnostic.goto_next()<CR>')
	set('n','g[','<cmd>lua vim.diagnostic.goto_prev()<CR>')

end

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers{
    function (server_name)
        require("lspconfig")[server_name].setup{
            on_attach = on_attach
        }
    end,
}
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
