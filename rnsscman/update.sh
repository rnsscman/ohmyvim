#!/bin/sh

if [ -d ~/.vim/bundle/Vundle.vim ]; then
    vim +PluginInstall +qall
fi
