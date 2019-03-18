#!/bin/sh

echo "vimrc cleaning:"
if [ -e ~/.vim/plugin/gtags.vim.org ]; then 
    rm -v ~/.vim/plugin/gtags.vim.org 
fi
if [ -e ~/.vim/plugin/gtags-cscope.vim.org ]; then 
    rm -v ~/.vim/plugin/gtags-cscope.vim.org
fi
if [ -d ~/.vim/bundle/Vundle.vim.org ]; then
    rm -frv ~/.vim/bundle/Vundle.vim.org
fi
if [ -e ~/.vimrc.org ] || [ -L ~/.vimrc.org ]; then
    rm -v ~/.vimrc.org
fi
