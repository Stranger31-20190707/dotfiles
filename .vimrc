syntax on
filetype plugin indent on

set autoindent
set number
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2

if !isdirectory($HOME."/vimfiles/tmp")
    call mkdir($HOME."/vimfiles/tmp", "p")
endif
set directory=~/vimfiles/tmp
set undodir=~/vimfiles/tmp
set backupdir=~/vimfiles/tmp
