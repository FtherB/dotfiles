" colorscheme

let g:mdn = expand('<sfile>:t:r')
set background=dark
hi clear

" Line numbers
hi LineNr guifg=#71839b guibg=NONE ctermfg=241 
hi CursorLineNr guifg=#ffffff ctermfg=15 term=bold,underline
hi link LineNrAbove LineNr
hi link LineNrBelow LineNr

hi EndOfBuffer guifg=#444444 guibg=NONE guisp=NONE gui=NONE ctermfg=237

hi CursorLine guifg=NONE guibg=NONE cterm=underline gui=underline ctermfg=NONE ctermbg=NONE

" syntax
hi Comment guifg=#838091 cterm=italic gui=italic
hi Number guifg=#f4a261
hi link Boolean Number
hi link Float Number

hi String guifg=#81b29a
hi link Character String

hi Function guifg=#86abdc
hi Identifier guifg=#63cdcf

hi PreProc guifg=#dc8ed9
hi link Define PreProc
hi link Macro PreProc
hi link PreCondit PreProc

hi Statement guifg=#9d79d6 cterm=bold gui=bold
hi Conditional guifg=#baa1e2
hi link Repeat Conditional
hi link Label Conditional
hi link Keyword Statement
hi link Exception Keyword
