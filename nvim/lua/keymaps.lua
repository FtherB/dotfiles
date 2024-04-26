local km = vim.keymap
-- nvim-tree
km.set('n','TT','<cmd>NvimTreeToggle<CR>')
km.set('n','TF','<cmd>NvimTreeFindFile<CR>')

-- telescope
local builtin = require('telescope.builtin')
km.set('n','<leader>p', builtin.find_files, {})
km.set('n','<leader>f', builtin.live_grep, {})
km.set('n','<leader>fb', builtin.buffers, {})
km.set('n','<leader>fh', builtin.help_tags, {})

-- other systems
-- split windows
-- move active window
-- km.set('','sh','<C-w>h')
-- km.set('','sk','<C-w>k')
-- km.set('','sj','<C-w>j')
-- km.set('','sl','<C-w>l')

--whichkey 
local wk = require("which-key")
wk.setup()
