#!/bin/bash

if [ -z "$(command -v gtags)" ] ||
    [ ! -f $HOME/.vim/plugin/gtags.vim ] ||
    [ ! -f $HOME/.vim/plugin/gtags-cscope.vim ]; then
    packages=(
        "autoconf"
        "automake"
        "bison"
        "flex"
        "gperf"
        "libtool"
        "m4"
        "perl"
        "libtool-bin"
        "libltdl-dev"
        "libncurses5-dev"
        "libncursesw5-dev"
        "texinfo"
        "wget"
    )
    sudo apt update
    for package in "${packages[@]}"; do
        if [ -z "$(command -v $package)" ]; then
            sudo apt install -y $package
        fi
    done
    sudo apt autoremove
    (
    GTAGS_VERSION="global-6.6.3"
    GTAGS_ARCHIVE="$GTAGS_VERSION.tar.gz"
    wget http://tamacom.com/global/$GTAGS_ARCHIVE
    tar zxf $GTAGS_ARCHIVE
    if [ -d $GTAGS_VERSION ]; then
        cd $GTAGS_VERSION
        sh reconf.sh
        ./configure
        make && sudo make install
        rm -rf global*
        mkdir -p $HOME/.vim/plugin
        cp -v /usr/local/share/gtags/gtags.vim $HOME/.vim/plugin/gtags.vim
        cp -v /usr/local/share/gtags/gtags-cscope.vim $HOME/.vim/plugin/gtags-cscope.vim
    fi
    )
fi

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
    # plugin_config
    if [ -f vimrc/plugin_config.vim ]; then
        echo "source \$vimconfig/vimrc/plugin_config.vim" >> vimrc/.vimrc
    fi
    # clipboard
    echo "set clipboard=unnamedplus" >> vimrc/.vimrc
    # why not work '.' after 'ln', so '$PWD' is used
    ln -svf $PWD/vimrc/.vimrc ~/.vimrc
fi

vim +PluginInstall +qall
