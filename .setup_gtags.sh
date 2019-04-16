#!/bin/sh

function gtags_install() {
    if [ $OSTYPE == 'linux-gnu' ]; then
        sudo apt install wget make -y
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
    elif [ $OSTYPE == 'cygwin' ]; then
        WGET_INSTALLED=$(which wget)
        if [ -z $WGET_INSTALLED ]; then
            return 1
        fi
        APTCYG_INSTALLED=$(which apt-cyg)
        if [ -z $APTCYG_INSTALLED ]; then
            wget rawgit.com/transcode-open/apt-cyg/master/apt-cyg
            install -v apt-cyg /usr/bin
            rm -v apt-cyg
        fi
        apt-cyg install make
        apt-cyg install autoconf automake bison flex gperf libtool m4 perl
        wget http://tamacom.com/global/global-6.6.3.tar.gz
        tar xzf global-6.6.3.tar.gz
        cd global-6.6.3
        sh reconf.sh 
        ./configure
        make # no Makefile
        make install
        cd -
        rm -rf global-6.6.3.tar.gz global-6.6.3
    fi
    return 0
}

if [ ! -e /usr/local/bin/gtags ] ||
    [ ! -e /usr/local/share/gtags/gtags.vim ] ||
    [ ! -e /usr/local/share/gtags/gtags-cscope.vim ]; then
    gtags_install
    if [ $? -nq 0 ]; then
        exit 1
    fi
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
        fi
    fi
    cp -v /usr/local/share/gtags/gtags-cscope.vim ~/.vim/plugin/gtags-cscope.vim
fi
