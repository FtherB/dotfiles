local km = vim.keymap
-- nvim-tree
km.set('n','<leader>nt','<cmd>NvimTreeToggle<CR>')
km.set('n','<leader>nf','<cmd>NvimTreeFindFile<CR>')
km.set('n','<leader>nn','<cmd>NvimTreeToggle<CR>')

-- telescope
local builtin = require('telescope.builtin')
km.set('n','<leader>tf', builtin.find_files, {})
km.set('n','<leader>tl', builtin.live_grep, {})
km.set('n','<leader>tb', builtin.buffers, {})
km.set('n','<leader>th', builtin.help_tags, {})
km.set('n','<leader>tt', '<cmd>Telescope<CR>')

km.set('n','<leader>l','<cmd>Lazy<CR>')
km.set('n','<leader>m','<cmd>Mason<CR>')

-- other keymaps
km.set({'n','v'},'<leader>f','^')
km.set({'n','v'},'<leader>e','$')

-- other systems
-- split windows
-- move active window
-- km.set('','sh','<C-w>h')
-- km.set('','sk','<C-w>k')
-- km.set('','sj','<C-w>j')
-- km.set('','sl','<C-w>l')

--whichkey 
local wk = require("which-key")
wk.add({
    { "<leader>t", group = "Telescope"},
    { "<leader>tf", desc = "find_files"},
    { "<leader>tl", desc = "live_grep"},
    { "<leader>tb", desc = "buffers"},
    { "<leader>th", desc = "help_tags"},
    { "<leader>n", group = "Nvim-Tree"},
})
wk.setup()
