vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function(use)
-- Plugin Manager
    use 'wbthomason/packer.nvim'

-- note plugins below

-- Library
    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-lua/popup.nvim'
    use 'kkharji/sqlite.lua'
    use 'MunifTanjim/nui.nvim'

    use 'rcarriga/nvim-notify'

-- Colorscheme
    use {
        'folke/tokyonight.nvim',
        cmd = {"Colorscheme tokyonight"},
    }

    use "EdenEast/nightfox.nvim"

-- File Explorer
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons',
       },
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use {
        'nvim-telescope/telescope-file-browser.nvim',
        requires = {'nvim-telescope/telescope.nvim','nvim-lua/plenary.nvim'}
    }

--    use {
--        'neoclide/coc.nvim', branch = 'release'
--    }
--

-- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/vim-vsnip'

--
        use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup{}
        end}

    use 'windwp/nvim-ts-autotag'
    use 'yamatsum/nvim-cursorline'
    use 'pechorin/any-jump.vim'
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup()
    end}

    use 'akinsho/toggleterm.nvim'

    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = "nvim-lua/plenary.nvim"
    }

    use {
        'akinsho/bufferline.nvim', tag='*',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup{}
        end
    }

-- Markdown
-- install without yarn or npm


    use({ "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
        cmd = {"MarkdownPreview"},
    })

    use "dhruvasagar/vim-table-mode"

    use {
     'gorbit99/codewindow.nvim',
     config = function()
      local codewindow = require('codewindow')
     codewindow.setup()
      codewindow.apply_default_keybinds()
     end,
    }

    use {
        "petertriho/nvim-scrollbar",
        event = {
            "BufWinEnter",
            "CmdwinLeave",
            "TabEnter",
            "TermEnter",
            "TextChanged",
            "VimResized",
            "WinEnter",
            "WinScrolled",
        },
        config = function()
            require("scrollbar").setup{}
        end,
    }

    use {
        "folke/noice.nvim",
        requires = {"MunifTanjim/nui.nvim","rcarriga/nvim-notify"},
    }
    use 'keaising/im-select.nvim'
    use {
        'lervag/vimtex',
        keys = { { "<Leader>ll"} },
    }
end)
