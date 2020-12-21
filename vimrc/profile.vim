if has("syntax")
    syntax on
endif

" display
set number
set ruler
set visualbell
set showmatch
set cursorcolumn
set cursorline
set colorcolumn=81
" tab and space, second way from :help tabstop
set tabstop=4
set shiftwidth=4
set expandtab
set list lcs=tab:\|.,trail:~
" indent
set autoindent
set cindent
set smartindent
" search
set hlsearch
set incsearch
set nowrapscan
set ignorecase
set smartcase
" edit
set autowrite
set autoread

let mapleader = ","

autocmd FileType markdown setlocal syntax=off
