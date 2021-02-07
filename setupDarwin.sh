#!/bin/bash

function packages_install() {
    packages=(
        "vim"
    )
    for package in "${packages[@]}"; do
        if [ -z "$(command -v $package)" ]; then
            apt-cyg install $package
        fi
    done
}

function gtags_install() {
    if [ -z "$(command -v gtags)" ] ||
        [ ! -f ~/.vim/plugin/gtags.vim ] ||
        [ ! -f ~/.vim/plugin/gtags-cscope.vim ]; then
        brew install global
        local plugins=(
            "gtags.vim"
            "gtags-cscope.vim"
        )
        [ -d ~/.vim/plugin/ ] || mkdir -p ~/.vim/plugin/
        for plugin in ${plugins[@]}; do
            if [ -f /usr/local/share/gtags/$plugin ]; then
                cp -v /usr/local/share/gtags/$plugin ~/.vim/plugin/
            fi
        done
    fi
}

function vimrc_install() {
    if [ -d vimrc ]; then
        echo "let \$vimconfig= "\"$PWD\" > vimrc/.vimrc
        echo "set clipboard=unnamed" >> vimrc/.vimrc
        local scripts=(
            "profile.vim"
            "keymap.vim"
            "function.vim"
            "plugin_config.vim"
        )
        for script in ${scripts[@]}; do
            if [ -f vimrc/$script ]; then
                echo "source \$vimconfig/vimrc/$script" >> vimrc/.vimrc
            fi
        done
        ln -svf $PWD/vimrc/.vimrc ~/.vimrc
    fi
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

function main() {
    packages_install
    gtags_install
    vimrc_install
    plugins_install
}

main

