require("options")
require("plugins")
require("keymaps")
require("autocmd")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.cmd("colorscheme nightfox")

require("plugins/nvim_tree")
require("plugins/vimtex")


require("telescope").load_extension "file_browser"

require ("telescope").setup{
    pickers = {
        find_files = {
            find_command = {"rg", "--files", "--hidden", "!.git" },
        },
    },
}

require("mason-lspconfig").setup{}
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

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expamd = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    sources = {
        { name = "nvim_lsp" },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-l>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
    }),
    experimental = {
        ghost_text = true,
    },
})

require("lualine").setup({
    options = {theme = 'nightfox'},
})

require("nvim-cursorline").setup{
    cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
    },
    cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
    }
}

--local cmp_autopairs = require('nvim-autopairs-completion.cmp')
-- local cmp = require('cmp')
-- cmp.event:on(
--    'confirm_done',
--    cmp_autopairs.on_confirm_done()
--    )

require('Comment').setup()

require('nvim-autopairs').setup()

require("toggleterm").setup{
    size = 30,
    direction = 'horizontal',
}

local null_ls = require("null-ls")
null_ls.setup{
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.luacheck,
    },
}

require("bufferline").setup{}
require('codewindow').setup()
-- require('scrollbar').setup()

require("notify")("VVLCOME!")

require("noice").setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    },
})

if vim.fn.has('mac')==1 then
    require('im_select').setup {
	    default_im_select = "com.apple.keylayout.US"
    }
-- elseif vim.fn.has('wsl')==1 then
--    require('im_select').setup {
--        default_im_select = "com.justsystems.imputmethod.atok33.Japanese"
--    }
end
