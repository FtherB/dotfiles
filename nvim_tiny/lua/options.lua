-- files
vim.opt.fileencodings={"utf-8","sjis","iso-2022-jp","euc-jp"}
vim.opt.encoding="utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileformats={"unix","dos","mac"}
vim.opt.swapfile = false
vim.opt.helplang = "en"
vim.opt.hidden = true
vim.opt.autoread = true
vim.opt.autowriteall=true

-- cursor and view
vim.opt.cursorline = true
vim.api.nvim_set_hl(0,'CursorLine',{underline = true})

-- cursor move

-- menu
vim.opt.wildmenu = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.showcmd = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.matchtime = 1
vim.opt.smartcase = true

--colorscheme
vim.opt.termguicolors = true
-- vim.opt.background = "dark"

-- indent
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- view
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.wrap = false
vim.opt.showtabline = 2
vim.opt.visualbell = false
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.winblend = 0
vim.opt.pumblend = 0

-- interface
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.signcolumn = "yes"
vim.opt.mouse = 'a'
vim.opt.scrolloff=10
vim.opt.sidescrolloff=16
vim.opt.sidescroll=1

-- system
vim.opt.ignorecase = true
vim.opt.backup = false
vim.opt.updatetime = 300

vim.o.clipboard = 'unnamedplus'

vim.opt.whichwrap:append("b,s,h,l,<,>,[,]")

--language
vim.opt.langmenu='en_US.UTF-8'
vim.api.nvim_exec('language message en_US.UTF-8', true)

-- pairs
vim.opt.matchpairs:append("（:）,「:」,『:』,【:】,［:］,＜:＞")

-- transparent background
vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
  highlight NormalNC guibg=none
  highlight NormalSB guibg=none
]])

Tabline = require('tabline')
vim.api.nvim_set_option('tabline', '%!v:lua.Tabline()')

vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*",
    callback = function()
        vim.cmd("redrawtabline")
    end,
})

require('statusline')
