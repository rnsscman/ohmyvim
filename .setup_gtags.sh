#!/bin/bash

GTAGS_VERSION='global-6.6.3'
GTAGS_ARCHIVE="$GTAGS_VERSION.tar.gz"

function gtags_install(){
    $PKG_MAN install autoconf automake bison flex gperf libtool m4 perl $CMD_OPT
    $PKG_MAN install $NEED_PACKAGES $CMD_OPT
    wget http://tamacom.com/global/$GTAGS_ARCHIVE
    tar xzf $GTAGS_ARCHIVE
    cd $GTAGS_VERSION
    sh reconf.sh 
    ./configure
    make
    $MAKE_INSTALL install
    cd ..
    rm -rf $GTAGS_ARCHIVE $GTAGS_VERSION
    mkdir -pv ~/.vim/plugin
    cp -v /usr/local/share/gtags/gtags.vim ~/.vim/plugin/gtags.vim
    cp -v /usr/local/share/gtags/gtags-cscope.vim ~/.vim/plugin/gtags-cscope.vim
}

if [[ "$OSTYPE" == *"darwin"* ]]; then
	NEED_PACKAGES=''
	PKG_MAN='brew'
	CMD_OPT=''
	MAKE_INSTALL='make install'
    gtags_install
elif [ "$OSTYPE" = "linux-gnu" ]; then
	NEED_PACKAGES='libtool-bin libltdl-dev libncurses5-dev libncursesw5-dev texinfo'
	PKG_MAN='sudo apt'
	CMD_OPT='-y'
	MAKE_INSTALL='sudo make install'
    gtags_install
fi
