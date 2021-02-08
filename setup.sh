#!/bin/bash

packages=(
    "vim"
)

function check_packages() {
    for package in "${packages[@]}"; do
        if [ -z "$(command -v $package)" ]; then
            echo "error : no package($package)"
            exit 1
        fi
    done
}

function plugins_install() {
    if [ ! -d ~/.vim/bundle/Vundle.vim/ ]; then
        mkdir -p ~/.vim/bundle/
        (
        cd ~/.vim/bundle/
        git clone https://github.com/VundleVim/Vundle.vim.git
        )
        vim +PluginInstall +qall
    fi
}

if [[ $OSTYPE == *"darwin"* ]]; then
    check_packages
    sh .gtags_install.sh
    sh .vimrc_install.sh
    plugins_install
elif [ $OSTYPE = "linux-gnu" ]; then
    check_packages
    sh .gtags_install.sh
    sh .vimrc_install.sh
    plugins_install
elif [ $OSTYPE = "cygwin" ]; then
    packages+=("unzip")
    packages+=("wget")
    check_packages
    sh .gtags_install.sh
    sh .vimrc_install.sh
    plugins_install
elif [ $OSTYPE = "msys" ]; then
    check_packages
    sh .vimrc_install.sh
else
    echo "error : unsupported environment($OSTYPE)"
    exit 1
fi

