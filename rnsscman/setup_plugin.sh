#!/bin/sh

if [ -e ./plugin_script.vim/cscope_maps.vim ]; then
    if [ ! -e ~/.vim/plugin/cscope_maps.vim ]; then
        cp -rv ./plugin_script.vim/cscope_maps.vim ~/.vim/plugin/cscope_maps.vim
    fi
fi

if [ -e ./plugin_script.vim/gtags.vim ]; then
    if [ ! -e ~/.vim/plugin/gtags.vim ]; then
        cp -rv ./plugin_script.vim/gtags.vim ~/.vim/plugin/gtags.vim
    fi
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

if [ -d ~/.vim/bundle/Vundle.vim ]; then
    vim +PluginInstall +qall
fi
