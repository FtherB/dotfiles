hi TabLine guifg=#ffffff guibg=#000000 term=italic cterm=italic gui=italic

hi TablineMode guifg=#000000 guibg=#cccccc term=bold,italic cterm=bold,italic gui=bold,italic
hi TablineVersion guifg=#ffffff guibg=#333333 term=italic cterm=italic gui=italic

hi TablineSep1 guifg=#cccccc guibg=#333333
hi TablineSep2 guifg=#333333 guibg=#000000

" mode
function! Vimmode()
    let l:mode_map = {
                \ 'n': 'NOR',
                \ 'i': 'INS',
                \ 'v': 'VIS',
                \ 'V': 'V-L',
                \ '': 'V-B',
                \ 'R': 'REP',
                \ 'c': 'CMD',
                \ 't': 'TER'
                \}
    return get(l:mode_map, mode()[0], 'OTH')
endfunction

function! Vimv()
    let l:out = execute('version')
    let l:v =  matchstr(l:out, 'VIM - Vi IMproved \zs[0-9.]\+')
    return 'Vim v' . l:v
endfunction

function! Tab()
    let l:separator = ''
    let l:s = ''

    let l:s .= '%#TablineMode#'
    let l:s .= ' ' . Vimmode() . ' '

    let l:s .= '%#TablineSep1#'
    let l:s .= l:separator

    let l:s .= '%#TablineVersion#'
    let l:s .= ' ' . Vimv() . ' '

    let l:s .= '%#TablineSep2#'
    let l:s .= l:separator

    let l:s .= '%#TabLine#'
    let l:s .= ' '

    return l:s
endfunction

set tabline=%!Tab()

autocmd ModeChanged * redrawtabline
