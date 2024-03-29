"This vimrc targets only Windows and Linux.
syntax on
filetype plugin indent on

set autoindent
set number
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2
set foldmethod=indent
set wildmenu
set incsearch
set hlsearch
set ruler
set showcmd
set list
set listchars=eol:$,tab:>-,space:%,nbsp:?

"status line include encoding, char code and total line count
set statusline=%<%f%h%m%r\ %{&fenc!=''?&fenc:&enc}%=\ 0x%B\ \ %l,%c%V\ %L

"use emoji
"emoji can be used at encoding(not fileencoding)=utf-8, see help of this option
set renderoptions=type:directx

"Open all folds when read buffer
autocmd BufRead * normal zR

"Comment for Windows batch file
autocmd FileType dosbatch setlocal commentstring=REM\ %s

"Shortcuts
nn <C-k> :set invwrap<CR>

"Change setting depend on OS
if has('Win32')
    let s:runTimePath=$HOME.'/vimfiles'
elseif has('Linux')
    let s:runTimePath=$HOME.'/.vim'
endif

"Set or create temporary directory
let s:tmpDir=s:runTimePath."/tmp"
if !isdirectory(glob(s:tmpDir))
    call mkdir(s:tmpDir, "p")
endif
let &directory=s:tmpDir
let &undodir=&directory
let &backupdir=&directory

"Set colorscheme
set background=dark
set t_Co=256
let s:colorSchemePath = s:runTimePath.'/colors/iceberg.vim'
if empty(glob(s:colorSchemePath))
    execute 'silent !curl -fLo' s:colorSchemePath '--create-dirs https://raw.githubusercontent.com/cocopon/iceberg.vim/master/colors/iceberg.vim'
endif
colorscheme iceberg

"Install Vim-Plug
let s:plugVimPath = s:runTimePath.'/autoload/plug.vim'
let s:pluggedPath = s:runTimePath.'/plugged'
if empty(glob(s:plugVimPath))
    execute 'silent !curl -fLo' s:plugVimPath '--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Set plugins
call plug#begin(s:pluggedPath)
    Plug 'tpope/vim-commentary'

call plug#end()
