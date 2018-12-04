#!/bin/sh

if [ -e ~/.vim/plugin/cscope_maps.vim.org ] && [ -e ~/.vim/plugin/cscope_maps.vim ]; then 
    rm -v ~/.vim/plugin/cscope_maps.vim
    mv -v ~/.vim/plugin/cscope_maps.vim.org ~/.vim/plugin/cscope_maps.vim
fi
if [ -e ~/.vim/plugin/gtags.vim.org ] && [ -e ~/.vim/plugin/gtags.vim ]; then 
    rm -v ~/.vim/plugin/gtags.vim
    mv -v ~/.vim/plugin/gtags.vim.org ~/.vim/plugin/gtags.vim
fi
if [ -d ~/.vim/bundle/Vundle.vim.org ] && [ -d ~/.vim/bundle/Vundle.vim ]; then
    rm -vrf ~/.vim/bundle/Vundle.vim
    mv -v ~/.vim/bundle/Vundle.vim.org ~/.vim/bundle/Vundle.vim
fi
if [ -e ~/.vimrc.org ] || [ -L ~/.vimrc.org ]; then
    if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then
    	rm -v ~/.vimrc
    	mv -v ~/.vimrc.org ~/.vimrc
fi
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    vim +PluginInstall +qall
fi
