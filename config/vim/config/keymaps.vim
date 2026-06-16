let mapleader = "\<Space>"
let maplocalleader = "\\"

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

for key in ['<Left>', '<Down>', '<Up>', '<Right>']
    exec 'nnoremap' key '<Nop>'
    exec 'inoremap' key '<Nop>'
    exec 'vnoremap' key '<Nop>'
    exec 'onoremap' key '<Nop>'
    exec 'cnoremap' key '<Nop>'
endfor

nnoremap <leader>h ^
vnoremap <leader>h ^
onoremap <leader>h ^

nnoremap <leader>l $
vnoremap <leader>l $
onoremap <leader>l $
