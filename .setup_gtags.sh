#!/bin/sh

echo "setup gtags:"
if [ -e $PWD/plugin_script/gtags.vim ]; then
    mkdir -pv ~/.vim/plugin
    if [ -e ~/.vim/plugin/gtags.vim ]; then
        mv -v ~/.vim/plugin/gtags.vim ~/.vim/plugin/gtags.vim.org
    fi
    cp -rv $PWD/plugin_script/gtags.vim ~/.vim/plugin/gtags.vim
fi
