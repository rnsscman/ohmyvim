#!/bin/sh

USABLE_OSTYPE="linux-gnu"

if [ $OSTYPE != $USABLE_OSTYPE ]; then
    echo "ostype is not $USABLE_OSTYPE"
    exit 1
fi

if [ ! -e /usr/bin/which ]; then
    sudo apt install which
fi

VIM_INSTALLED=$(which vim) # check vim installed
if [ -z $VIM_INSTALLED ]; then
    sudo apt install vim # vim install
fi

# gtags install
if [ -e .setup_gtags.sh ]; then
    if [ $# -eq 0 ]; then
        . ./.setup_gtags.sh
    else
        . ./.setup_gtags.sh $1
    fi
fi

# .vimrc install
if [ -d vimrc ]; then
    if [ -e vimrc/.plugin_setup_for_linux.vim ]; then
        if [ -e vimrc/plugin_setup.vim ]; then
            rm -v vimrc/plugin_setup.vim
        fi
        cp -v vimrc/.plugin_setup_for_linux.vim vimrc/plugin_setup.vim
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

# vundle install
mkdir -pv ~/.vim/bundle
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    if [ $# -ne 0 ] && [ "$1" = "--no-original" ]; then
        rm -frv ~/.vim/bundle/Vundle.vim
    else
        if [ -d ~/.vim/bundle/Vundle.vim.org ]; then
            rm -frv ~/.vim/bundle/Vundle.vim.org
        fi
        mv -v ~/.vim/bundle/Vundle.vim ~/.vim/bundle/Vundle.vim.org
    fi
fi
cd ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git
cd -

# plugin install
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    vim +PluginInstall +qall
fi

# vimtags install
VIMTAGS_PATH="$HOME/.local/bin"
if [ -e .vimtags ]; then
    VIMTAGS_PATH_SET=$(echo $PATH | grep $VIMTAGS_PATH)
    if [ -z $VIMTAGS_PATH_SET ]; then
        echo "PATH is not set for vimtags"
    else
        mkdir -pv $VIMTAGS_PATH
        cp -v .vimtags $VIMTAGS_PATH/vimtags
    fi
fi
