if has("eval")
    let mapleader = "\<Space>"
    let maplocalleader = "\\"

    nnoremap <leader>h ^
    vnoremap <leader>h ^
    onoremap <leader>h ^

    nnoremap <leader>l $
    vnoremap <leader>l $
    onoremap <leader>l $
else
    nnoremap <Space>h ^
    vnoremap <Space>h ^
    onoremap <Space>h ^

    nnoremap <Space>l $
    vnoremap <Space>l $
    onoremap <Space>l $
endif

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>



function! DisableArrowKeys() abort
    for key in ['<Left>', '<Down>', '<Up>', '<Right>']
        exec 'nnoremap' key '<Nop>'
        exec 'inoremap' key '<Nop>'
        exec 'vnoremap' key '<Nop>'
        exec 'onoremap' key '<Nop>'
        exec 'cnoremap' key '<Nop>'
    endfor
endfunction

augroup DisableArrows
    autocmd!
    autocmd VimEnter,BufEnter,CursorHold,ModeChanged * call DisableArrowKeys()
augroup END
