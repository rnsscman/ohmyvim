#!/bin/sh

echo "setup cscope:"
if [ -e $PWD/plugin_script/cscope_maps.vim ]; then
    if [ -e ~/.vim/plugin/cscope_maps.vim ]; then
        mv -v ~/.vim/plugin/cscope_maps.vim ~/.vim/plugin/cscope_maps.vim.org
    fi
    mkdir -pv ~/.vim/plugin
    cp -rv $PWD/plugin_script/cscope_maps.vim ~/.vim/plugin/cscope_maps.vim
fi
