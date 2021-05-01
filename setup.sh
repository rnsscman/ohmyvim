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

tools=(
    ".gtags_install.sh"
    ".vimrc_install.sh"
)
function check_tools() {
    for tool in "${tools[@]}"; do
        if [ ! -f $tool ]; then
            echo "error : no tool($tool)"
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
    :
elif [ $OSTYPE = "linux-gnu" ]; then
    :
elif [ $OSTYPE = "cygwin" ]; then
    packages+=("unzip")
    packages+=("wget")
elif [ $OSTYPE = "msys" ]; then
    :
else
    echo "error : unsupported environment($OSTYPE)"
    exit 1
fi

check_packages
check_tools
./.vimrc_install.sh
if [ $OSTYPE != "msys" ]; then
    ./.gtags_install.sh
    plugins_install
fi

