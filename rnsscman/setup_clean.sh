#!/bin/sh

if [ -e ~/.vim/plugin/cscope_maps.vim.org ]; then
    rm -v ~/.vim/plugin/cscope_maps.vim.org 
fi
if [ -e ~/.vim/plugin/gtags.vim.org ]; then 
    rm -v ~/.vim/plugin/gtags.vim.org 
fi
if [ -d ~/.vim/bundle/Vundle.vim.org ]; then
    rm -vrf ~/.vim/bundle/Vundle.vim.org 
fi
if [ -e ~/.vimrc.org ] || [ -L ~/.vimrc.org ]; then
    rm -v ~/.vimrc.org
fi
