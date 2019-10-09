filetype off

" Clear all runtimepath
set runtimepath=$VIMRUNTIME

" Add vader.vim to runtimepath
set runtimepath+=./vader.vim

" Add plugin directory into runtimepath
set runtimepath+=../

filetype plugin indent on
syntax on

highlight HighlightedLineNr guifg=White ctermfg=7
highlight DimLineNr guifg=Magenta ctermfg=5
