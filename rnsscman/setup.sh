#!/bin/sh

if [ -e $PWD/plugin_script/cscope_maps.vim ]; then
    if [ -e ~/.vim/plugin/cscope_maps.vim ]; then
        mv -v ~/.vim/plugin/cscope_maps.vim ~/.vim/plugin/cscope_maps.vim.org
    fi
    cp -rv $PWD/plugin_script/cscope_maps.vim ~/.vim/plugin/cscope_maps.vim
fi

if [ -e $PWD/plugin_script/gtags.vim ]; then
    if [ -e ~/.vim/plugin/gtags.vim ]; then
        mv -v ~/.vim/plugin/gtags.vim ~/.vim/plugin/gtags.vim.org
    fi
    cp -rv $PWD/plugin_script/gtags.vim ~/.vim/plugin/gtags.vim
fi

if [ -d ~/.vim/bundle/Vundle.vim ]; then
    mv -v ~/.vim/bundle/Vundle.vim ~/.vim/bundle/Vundle.vim.org
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "let \$VIMENVROOT = "\"$PWD\" > $PWD/vimrc/.vimrc
cat $PWD/vimrc/.vimrc.org >> $PWD/vimrc/.vimrc

if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then
    mv -v ~/.vimrc ~/.vimrc.org
fi
ln -sv $PWD/vimrc/.vimrc ~/.vimrc

if [ -d ~/.vim/bundle/Vundle.vim ]; then
    vim +PluginInstall +qall
fi
