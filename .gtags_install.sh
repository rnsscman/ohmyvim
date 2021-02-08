#!/bin/bash

if [ -z "$(command -v gtags)" ] ||
    [ ! -f ~/.vim/plugin/gtags.vim ] ||
    [ ! -f ~/.vim/plugin/gtags-cscope.vim ]; then
    if [[ "$OSTYPE" == *"darwin"* ]]; then
        brew install global
    elif [ "$OSTYPE" = "linux-gnu" ]; then
        sudo apt install global
    elif [ "$OSTYPE" = "cygwin" ]; then
        wget -O global.zip http://adoxa.altervista.org/global/dl.php?f=win32
        [ -d /usr/global/ ] || mkdir -p /usr/global/
        unzip global.zip -d /usr/global/
        rm -v global.zip
        chmod 755 /usr/global/bin/*
    else
        echo "error : unsupported environment($OSTYPE)"
        exit 1
    fi
    plugins=(
        "gtags.vim"
        "gtags-cscope.vim"
    )
    [ -d ~/.vim/plugin/ ] || mkdir -p ~/.vim/plugin/
    for plugin in ${plugins[@]}; do
        if [ -f /usr/global/share/gtags/$plugin ]; then
            cp -v /usr/global/share/gtags/$plugin ~/.vim/plugin/
        fi
    done
fi

