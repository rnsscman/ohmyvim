execute pathogen#infect()
syntax on
filetype plugin indent on

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
