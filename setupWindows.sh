#!/bin/bash

if [ -d vimrc ]; then
    echo "let \$vimconfig= "\"$PWD\" > vimrc/.vimrc
    # profile
    if [ -f vimrc/profile.vim ]; then
        echo "source \$vimconfig/vimrc/profile.vim" >> vimrc/.vimrc
    fi
    # keymap
    if [ -f vimrc/keymap.vim ]; then
        echo "source \$vimconfig/vimrc/keymap.vim" >> vimrc/.vimrc
    fi
    # function
    if [ -f vimrc/function.vim ]; then
        echo "source \$vimconfig/vimrc/function.vim" >> vimrc/.vimrc
    fi
    # why not work '.' after 'ln', so '$PWD' is used
    ln -svf $PWD/vimrc/.vimrc ~/.vimrc
fi

