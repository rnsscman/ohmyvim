set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
Plugin 'kien/ctrlp.vim'                 " ctrlp
" Plugin 'raimondi/delimitmate'           " delimitmate
Plugin 'scrooloose/nerdcommenter'       " nerdcommenter
Plugin 'scrooloose/nerdtree'            " nerdtree
" Plugin 'SrcExpl'                        " SrcExpl
" Plugin 'ervandew/supertab'              " supertab
" Plugin 'godlygeek/tabular'              " tabular
Plugin 'majutsushi/tagbar'              " tagbar
Plugin 'vim-airline/vim-airline'        " vim-airline
Plugin 'vim-airline/vim-airline-themes' " vim-airline-themes
Plugin 'airblade/vim-gitgutter'         " vim-gitgutter
" Plugin 'valloric/youcompleteme'         " youcompleteme
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
    if filereadable(expand("$myvimrootdir/vimrc/plugin_config/ctrlp"))
        source $myvimrootdir/vimrc/plugin_config/ctrlp
    endif
endif
" if isdirectory(expand("~/.vim/bundle/delimitmate"))
"     if filereadable(expand("$myvimrootdir/vimrc/plugin_config/delimitmate"))
"         source $myvimrootdir/vimrc/plugin_config/delimitmate
"     endif
" endif
if isdirectory(expand("~/.vim/bundle/nerdcommenter"))
    if filereadable(expand("$myvimrootdir/vimrc/plugin_config/nerdcommenter"))
        source $myvimrootdir/vimrc/plugin_config/nerdcommenter
    endif
endif
if isdirectory(expand("~/.vim/bundle/nerdtree"))
    if filereadable(expand("$myvimrootdir/vimrc/plugin_config/nerdtree"))
        source $myvimrootdir/vimrc/plugin_config/nerdtree
    endif
endif
" if isdirectory(expand("~/.vim/bundle/SrcExpl"))
"     if filereadable(expand("$myvimrootdir/vimrc/plugin_config/srcexpl"))
"         source $myvimrootdir/vimrc/plugin_config/srcexpl
"     endif
" endif
" if isdirectory(expand("~/.vim/bundle/supertab"))
"     if filereadable(expand("$myvimrootdir/vimrc/plugin_config/supertab"))
"         source $myvimrootdir/vimrc/plugin_config/supertab
"     endif
" endif
" if isdirectory(expand("~/.vim/bundle/tabular"))
"     if filereadable(expand("$myvimrootdir/vimrc/plugin_config/tabular"))
"         source $myvimrootdir/vimrc/plugin_config/tabular
"     endif
" endif
if isdirectory(expand("~/.vim/bundle/tagbar"))
    if filereadable(expand("$myvimrootdir/vimrc/plugin_config/tagbar"))
        source $myvimrootdir/vimrc/plugin_config/tagbar
    endif
endif
if isdirectory(expand("~/.vim/bundle/vim-airline"))
    if filereadable(expand("$myvimrootdir/vimrc/plugin_config/vim-airline"))
        source $myvimrootdir/vimrc/plugin_config/vim-airline
    endif
endif
if isdirectory(expand("~/.vim/bundle/vim-airline-themes"))
    if filereadable(expand("$myvimrootdir/vimrc/plugin_config/vim-airline-themes"))
        source $myvimrootdir/vimrc/plugin_config/vim-airline-themes
    endif
endif
if isdirectory(expand("~/.vim/bundle/vim-gitgutter"))
    if filereadable(expand("$myvimrootdir/vimrc/plugin_config/vim-gitgutter"))
        source $myvimrootdir/vimrc/plugin_config/vim-gitgutter
    endif
endif
" if isdirectory(expand("~/.vim/bundle/youcompleteme"))
"     if filereadable(expand("$myvimrootdir/vimrc/plugin_config/youcompleteme"))
"         source $myvimrootdir/vimrc/plugin_config/youcompleteme
"     endif
" endif
if filereadable(expand("~/.vim/plugin/gtags.vim"))
    if filereadable(expand("$myvimrootdir/vimrc/plugin_config/gtags"))
        source $myvimrootdir/vimrc/plugin_config/gtags
    endif
endif
if filereadable(expand("~/.vim/plugin/gtags-cscope.vim"))
    if filereadable(expand("$myvimrootdir/vimrc/plugin_config/gtags-cscope"))
        source $myvimrootdir/vimrc/plugin_config/gtags-cscope
    endif
endif
