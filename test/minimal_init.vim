filetype off

" Clear all runtimepath
set runtimepath=$VIMRUNTIME

" Add vader.vim to runtimepath
set runtimepath+=./vader.vim

" Add plugin directory into runtimepath
set runtimepath+=../

set termguicolors
filetype plugin indent on
syntax on

highlight LineNr guifg=Yellow guibg=Black
