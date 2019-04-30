#!/bin/sh

USABLE_OSTYPE="cygwin"

if [ $OSTYPE != $USABLE_OSTYPE ]; then
    echo "ostype is not $USABLE_OSTYPE"
    exit 1
fi

if [ ! -e /usr/bin/which ]; then
    echo "which it not installed"
    exit 1
fi

LYNX_INSTALLED=$(which lynx)
if [ -z LYNX_INSTALLED ]; then
    echo "lynx is not installed"
    exit 1
fi
lynx -source rawgit.com/transcode-open/apt-cyg/master/apt-cyg > apt-cyg
install apt-cyg /usr/bin
rm apt-cyg

apt-cyg install vim curl git ctags

# .vimrc install
if [ -d vimrc ]; then
    if [ -e vimrc/.plugin_setup_for_cygwin.vim ]; then
        if [ -e vimrc/plugin_setup.vim ]; then
            rm -v vimrc/plugin_setup.vim
        fi
        cp -v vimrc/.plugin_setup_for_cygwin.vim vimrc/plugin_setup.vim
    fi
    if [ -e vimrc/.vimrc.org ]; then
        echo "let \$myvimrootdir= "\"$PWD\" > vimrc/.vimrc
        cat vimrc/.vimrc.org >> vimrc/.vimrc
        if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then
            if [ $# -ne 0 ] && [ "$1" = "--no-original" ]; then
                rm -v ~/.vimrc
            else
                if [ -e ~/.vimrc.org ] || [ -L ~/.vimrc.org ]; then
                    rm -v ~/.vimrc.org
                fi
                mv -v ~/.vimrc ~/.vimrc.org
            fi
        fi
        ln -sv $PWD/vimrc/.vimrc ~/.vimrc # why not work '.' after 'ln', so '$PWD' is used
    fi
fi

CURL_INSTALLED=$(which curl)
if [ -z CURL_INSTALLED ];then
    echo "curl is not installed"
    exit 1
fi
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

mkdir -pv ~/.vim/bundle
if [ -d ~/.vim/bundle ]; then
    cd ~/.vim/bundle
    git clone https://github.com/kien/ctrlp.vim
    git clone https://github.com/scrooloose/nerdtree
    git clone https://github.com/scrooloose/nerdcommenter
    git clone https://github.com/majutsushi/tagbar
    git clone https://github.com/airblade/vim-gitgutter
    cd -
fi
