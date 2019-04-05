#!/bin/sh

if [ -e .setup_gtags.sh ]; then
    if [ $# -eq 0 ]; then
        . ./.setup_gtags.sh
    else
        . ./.setup_gtags.sh $1
    fi
fi

if [ -d ~/.vim/bundle/Vundle.vim ]; then
    vim +PluginClean +qall
    vim +PluginInstall +qall
fi

if [ -e .vimtags ]; then
    VIMTAGS_PATH=$(echo $PATH | grep $HOME/.local/bin)
    if [ -n $VIMTAGS_PATH ]; then
        mkdir -pv ~/.local/bin
        cp -v .vimtags ~/.local/bin/vimtags
    fi
fi
