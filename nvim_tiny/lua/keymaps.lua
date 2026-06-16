local km = vim.keymap
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- c-h/j/k/l as arrowas arrow in insert mode
km.set('i','<C-h>','<Left>')
km.set('i','<C-j>','<Down>')
km.set('i','<C-k>','<Up>')
km.set('i','<C-l>','<Right>')

km.set('i','<C-b>','<BS>')

-- other keymaps
km.set({'n','v','o'},'<leader>h','^')
km.set({'n','v','o'},'<leader>l','$')
km.set('n','q:', '<Nop>', {noremap = true})
