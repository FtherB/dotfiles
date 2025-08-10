local km = vim.keymap
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- c-h/j/k/l as arrowas arrow in insert mode
km.set('i','<C-h>','<Left>')
km.set('i','<C-j>','<Down>')
km.set('i','<C-k>','<Up>')
km.set('i','<C-l>','<Right>')

km.set('i','<C-b>','<BS>')

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

km.set('n','<localleader>l','<cmd>Lazy<CR>')
km.set('n','<localleader>m','<cmd>Mason<CR>')

-- other keymaps
km.set({'n','v','o'},'<leader>h','^')
km.set({'n','v','o'},'<leader>l','$')
km.set('n','q:', '<Nop>', {noremap = true})

-- markdown
km.set('n','<leader>mp','<cmd>MarkdownPreviewToggle<CR>')
km.set('n','<leader>mr','<cmd>RenderMarkdown toggle<CR>')

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
    { "<leader>h", desc = "Start of line (non ws)"},
    { "<leader>l", desc = "End of line"},
    { "<leader>m", group = "Markdown plugins"}
})
wk.setup()
