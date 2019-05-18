#!/bin/sh

GTAGS_VERSION='global-6.6.3'
GTAGS_ARCHIVE="$GTAGS_VERSION.tar.gz"

function gtags_install(){
    $PM_CMD install $NEED_PACKAGES $PM_OPT
    wget http://tamacom.com/global/$GTAGS_ARCHIVE
    tar xzf $GTAGS_ARCHIVE
    cd $GTAGS_VERSION
    sh reconf.sh 
    ./configure
    make
    $MAKE_INSTALL install
    cd -
    rm -rf $GTAGS_ARCHIVE $GTAGS_VERSION
    mkdir -pv ~/.vim/plugin
    cp -v /usr/local/share/gtags/gtags.vim ~/.vim/plugin/gtags.vim
    cp -v /usr/local/share/gtags/gtags-cscope.vim ~/.vim/plugin/gtags-cscope.vim
}

if [[ $OSTYPE == 'linux-gnu' ]]; then
	NEED_PACKAGES='autoconf automake bison flex gperf libtool libtool-bin m4 perl'
	PM_CMD='sudo apt'
	PM_OPT='-y'
	MAKE_INSTALL='sudo make install'
    gtags_install
elif [[ $OSTYPE == *'darwin'* ]]; then
	NEED_PACKAGES='autoconf automake bison flex gperf libtool m4 perl'
	PM_CMD='brew'
	PM_OPT=''
	MAKE_INSTALL='make install'
    gtags_install
elif [[ $OSTYPE == 'cygwin' ]]; then
	NEED_PACKAGES='autoconf automake bison flex gperf libtool m4 perl'
	PM_CMD='apt-cyg'
	PM_OPT='-y'
	MAKE_INSTALL='make install'
fi
