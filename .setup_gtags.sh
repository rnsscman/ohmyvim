#!/bin/sh

echo "setup gtags:"
if [ -e $PWD/plugin_script/gtags.vim ] && [ -e $PWD/plugin_script/gtags-cscope.vim ]; then
    mkdir -pv ~/.vim/plugin
    if [ -e ~/.vim/plugin/gtags.vim ]; then
        mv -v ~/.vim/plugin/gtags.vim ~/.vim/plugin/gtags.vim.org
    fi
    cp -rv $PWD/plugin_script/gtags.vim ~/.vim/plugin/gtags.vim
    if [ -e ~/.vim/plugin/gtags-cscope.vim ]; then
        mv -v ~/.vim/plugin/gtags-cscope.vim ~/.vim/plugin/gtags-cscope.vim.org
    fi
    cp -rv $PWD/plugin_script/gtags-cscope.vim ~/.vim/plugin/gtags-cscope.vim
fi
