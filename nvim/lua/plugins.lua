local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
{
    -- plugins
    -- colorscheme
    {
        'EdenEast/nightfox.nvim',
    },
    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' },
        lazy = true,
        cmd = "Telescope",
    },

    -- LSP
    'neovim/nvim-lspconfig',
    {
        'mason-org/mason.nvim',
        version = "^1.0.0",
    },
    {
        'mason-org/mason-lspconfig.nvim',
        version = "^1.0.0",

    },

    -- auto cmp
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/vim-vsnip",

    {
        'windwp/nvim-autopairs',
        event = "insertEnter",
        config = true,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
--        opts = {
--            options = {
                -- theme = 'nightfox',
--            },
--         },
    },

    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      lazy = true,
      ft = { "markdown" }
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
        lazy = true,
        ft = { "markdown" },
    },

--     {
--         "nvim-neo-tree/neo-tree.nvim",
--         branch = "v3.x",
--         dependencies = {
--             "nvim-lua/plenary.nvim",
--             "nvim-tree/nvim-web-devicons",
--             "MunifTanjim/nui.nvim",
--         },
--         enabled = false,
--     },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup{}
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",opts = {},
        enabled = false,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {},
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    {
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({})
        end,
        enabled = false,
    },
    {
        "mbbill/undotree",
        enabled = false,
    },
    {
        "lervag/vimtex",
        enabled = false,
        lazy = true,
        ft = { "tex" },
        init = function()
            vim.g.vimtex_view_method = 'skim'
        end,
    },
    {
        "oflisback/obsidian-bridge.nvim",
        lazy = true,
        enabled = false,
        ft = { "markdown" },
        opts = {
            { scroll_sync = true },
        },
    },

    {
        "github/copilot.vim",
        lazy = true,
        cmd = { "Copilot", "Copilot setup" },
    },

    {
        "monaqa/dial.nvim",
    },

    {
        "lewis6991/gitsigns.nvim",
    },

    -- debug plugins
    {
        "rcarriga/nvim-dap-ui",
        enabled = false,
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
            { "theHamsta/nvim-dap-virtual-text", opts = {}}
        },
    },
},
-- lazy options
{
    performance = {
        rtp = {
            disabled_plugins = {
                "netrw",
                "netrwPlugin",
                "netrwSettings",
                "netrwFileHandlers",
            },
        },
    },
})
