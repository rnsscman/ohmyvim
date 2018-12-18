#!/bin/sh

if [ $OSTYPE == "linux-gnu" ]; then
    if [ -e $PWD/plugin_script/rnsscman/youcompleteme.vim ]; then
        echo "install development tools for youcompleteme:"
        sudo apt install build-essential
        sudo apt install cmake
        sudo apt install python3-dev
        mkdir -pv ~/.vim/bundle
        if [ -d ~/.vim/bundle/youcompleteme ]; then
            if [ -e ~/.vim/bundle/youcompleteme/install.py ]; then
                echo "Compiling YCM with semantic support for C-family languages:"
                python3 ~/.vim/bundle/youcompleteme/install.py --clang-completer
            fi
        fi
    fi
elif [ $OSTYPE == "darwin" ]; then
    echo "not defined on mac"
elif [ $OSTYPE == "cygwin" ]; then
    echo "not defined on cygwin"
elif [ $OSTYPE == "msys" ]; then
    echo "not defined on mingw"
fi
