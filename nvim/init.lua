vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("options")
require("plugins")

vim.cmd("colorscheme nightfox")

require("lsps")
require("toggle")
-- require("indent")

