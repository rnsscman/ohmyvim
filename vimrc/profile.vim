if has("syntax")
    syntax on
endif
filetype plugin indent on

" display
set number
set ruler
set visualbell
set showmatch
set cursorcolumn
set cursorline
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

function RemoveTrailingSpace()
    %s/\s\+$//e
    ''
endfunction
command! RemoveTrailingSpace call RemoveTrailingSpace()

function RemoveNewLineChar()
    %s///g
    ''
endfunction
command! RemoveNewLineChar call RemoveNewLineChar()

function TabToSpace()
    set expandtab
    retab
endfunction
command! TabToSpace call TabToSpace()
