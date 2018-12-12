#!/bin/sh

if [ -d ~/.vim/bundle/Vundle.vim ]; then
    vim +PluginClean +qall
    vim +PluginInstall +qall
fi
