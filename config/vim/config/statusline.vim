hi StatusLine guifg=#dddddd guibg=#000000 term=italic cterm=italic gui=italic
hi StatusLineNC guifg=#333333 guibg=#000000 term=italic cterm=italic gui=italic
hi Status1 guifg=#000000 guibg=#cccccc term=bold,italic cterm=bold,italic gui=bold,italic
hi Status2 guifg=#ffffff guibg=#333333 term=italic cterm=italic gui=italic

hi StatusSep1 guifg=#cccccc guibg=#333333
hi StatusSep2 guifg=#333333 guibg=#000000

let s:sepl = ''
let s:sepr = ''

function! Wc() abort
    let l:c = wordcount()

    if has_key(l:c, 'visual_words')
        return printf('VIS: %d words, %d chars  %d words, %d chars', l:c.visual_words, l:c.visual_chars, l:c.words, l:c.chars)
    else
        return printf('%d words, %d chars', l:c.words, l:c.chars)
    endif
endfunction

function! Filename() abort
    if expand('%') != ''
        return expand('%:p')
    else
        return '[No Name]'
    endif
endfunction

function! LinePercent() abort
    let l:line = line('.')
    let l:last = line('$')

    if l:line == 1
        return 'Top'
    elseif l:line == l:last
        return 'Bot'
    else
        let l:p = float2nr((l:line * 100.0) / l:last)
        return printf('%2d%%', l:p)
    endif
endfunction


" statusline left
let s:stl_l = ''

let s:stl_l .= '%#Status2#'
let s:stl_l .= ' %{Filename()}%m%r '

let s:stl_l .= '%#StatusSep2#' . s:sepl
let s:stl_l .= '%*'

" statusline right
let s:stl_r = ''
let s:stl_r .='%{Wc()} '

let s:stl_r .= '%#StatusSep2#' . s:sepr
let s:stl_r .= '%#Status2# %{LinePercent()} '

let s:stl_r .= '%#StatusSep1#' . s:sepr
let s:stl_r .= '%#Status1# %3l:%-2c '

let s:stl = s:stl_l . '%=' . s:stl_r

let &statusline = s:stl
