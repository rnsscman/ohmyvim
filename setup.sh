#!/bin/sh

VIM_INSTALLED=$(command -v vim) # check vim installed
if [ -z $VIM_INSTALLED ]; then
    if [ $OSTYPE == 'linux-gnu' ]; then
        sudo apt install vim # vim install
    fi
fi

# gtags install
if [ -e .setup_gtags.sh ]; then
    if [ $# -eq 0 ]; then
        . ./.setup_gtags.sh
    else
        . ./.setup_gtags.sh $1
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
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# .vimrc install
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

# plugin install
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    vim +PluginInstall +qall
fi

# vimtags install
if [ -e .vimtags ]; then
    VIMTAGS_PATH=$(echo $PATH | grep $HOME/.local/bin)
    if [ -z $VIMTAGS_PATH ]; then
        if [ -e ~/.profile ]; then
            echo PATH="$HOME/bin:$HOME/.local/bin:$PATH" >> ~/.profile
            . ~/.profile
        else
            if [ -e ~/.bashrc ]; then
                echo PATH="$HOME/bin:$HOME/.local/bin:$PATH" >> ~/.bashrc
                . ~/.bashrc
            fi
        fi
    fi

    VIMTAGS_PATH=$(echo $PATH | grep $HOME/.local/bin)
    if [ -n $VIMTAGS_PATH ]; then
        mkdir -pv ~/.local/bin
        cp -v .vimtags ~/.local/bin/vimtags
    fi
fi
