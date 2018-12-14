#!/bin/sh

echo "setup cscope:"
if [ -e $PWD/plugin_script/cscope_maps.vim ]; then
    mkdir -pv ~/.vim/plugin
    if [ -e ~/.vim/plugin/cscope_maps.vim ]; then
        mv -v ~/.vim/plugin/cscope_maps.vim ~/.vim/plugin/cscope_maps.vim.org
    fi
    cp -rv $PWD/plugin_script/cscope_maps.vim ~/.vim/plugin/cscope_maps.vim
fi
