#!/bin/sh

function gtags_install() {
    sudo apt install autoconf automake bison flex gperf libtool libtool-bin m4 perl -y
    wget http://tamacom.com/global/global-6.6.3.tar.gz
    tar xzf global-6.6.3.tar.gz
    cd global-6.6.3
    sh reconf.sh 
    ./configure
    make
    sudo make install
    cd -
    rm -rf global-6.6.3.tar.gz global-6.6.3
}

if [ ! -e /usr/local/bin/gtags ] ||
    [ ! -e /usr/local/share/gtags/gtags.vim ] ||
    [ ! -e /usr/local/share/gtags/gtags-cscope.vim ]; then
    gtags_install
fi    

if [ -e /usr/local/bin/gtags ] &&
    [ -e /usr/local/share/gtags/gtags.vim ] &&
    [ -e /usr/local/share/gtags/gtags-cscope.vim ]; then
    mkdir -pv ~/.vim/plugin
    if [ -e ~/.vim/plugin/gtags.vim ]; then
        if [ $# -ne 0 ] && [ "$1" = "--no-original" ]; then
            rm -v ~/.vim/plugin/gtags.vim
        else
            if [ -e ~/.vim/plugin/gtags.vim.org ]; then
                rm -v ~/.vim/plugin/gtags.vim.org
            fi
            mv -v ~/.vim/plugin/gtags.vim ~/.vim/plugin/gtags.vim.org
        fi 
    fi
    cp -v /usr/local/share/gtags/gtags.vim ~/.vim/plugin/gtags.vim

    if [ -e ~/.vim/plugin/gtags-cscope.vim ]; then
        if [ $# -ne 0 ] && [ "$1" = "--no-original" ]; then
            rm -v ~/.vim/plugin/gtags-cscope.vim
        else
            if [ -e ~/.vim/plugin/gtags-cscope.vim.org ]; then
                rm -v ~/.vim/plugin/gtags-cscope.vim.org
            fi
            mv -v ~/.vim/plugin/gtags-cscope.vim ~/.vim/plugin/gtags-cscope.vim.org
        if
    fi
    cp -v /usr/local/share/gtags/gtags-cscope.vim ~/.vim/plugin/gtags-cscope.vim
fi
