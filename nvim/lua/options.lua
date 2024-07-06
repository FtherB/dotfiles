-- files
vim.opt.fileencodings={"utf-8","sjis","iso-2022-jp","euc-jp"}
vim.opt.encoding="utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileformats={"unix","dos","mac"}
vim.opt.swapfile = false
vim.opt.helplang = "en"
vim.opt.hidden = true
vim.opt.autoread = true

-- cursor and view
vim.opt.cursorline = true

-- cursor move

-- menu
vim.opt.wildmenu = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.showcmd = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.matchtime = 1

--colorscheme
-- vim.opt.termguicolors = true
vim.opt.background = "dark"

-- indent
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- view
vim.opt.number = true
vim.opt.title = true
vim.opt.wrap = false
vim.opt.showtabline = 0
vim.opt.visualbell = false
vim.opt.showmatch = true
vim.opt.ambiwidth = 'double'
vim.opt.relativenumber = true

-- interface
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.signcolumn = "yes"
vim.opt.mouse = 'a'
vim.opt.scrolloff=10

-- system
vim.opt.ignorecase = true
vim.opt.backup = false
vim.opt.updatetime = 300

vim.o.clipboard = 'unnamedplus'

vim.opt.whichwrap:append('b')
vim.opt.whichwrap:append('s')
vim.opt.whichwrap:append('h')
vim.opt.whichwrap:append('l')
vim.opt.whichwrap:append('<')
vim.opt.whichwrap:append('>')
vim.opt.whichwrap:append('[')
vim.opt.whichwrap:append(']')

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set('n','<Leader>a',"<cmd>echo 'hello'<CR>")
