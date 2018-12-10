#!/bin/sh

# setup cscope
if [ -e $PWD/.setup_cscope.sh ]; then
    source $PWD/.setup_cscope.sh
fi
# setup gtags
if [ -e $PWD/.setup_gtags.sh ]; then
    source $PWD/.setup_gtags.sh
fi
# setup vundle
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    mv -v ~/.vim/bundle/Vundle.vim ~/.vim/bundle/Vundle.vim.org
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# make myvimrc
echo "let \$VIMENVROOT = "\"$PWD\" > $PWD/vimrc/.vimrc
cat $PWD/vimrc/.vimrc.org >> $PWD/vimrc/.vimrc
# make .vimrc in home symbolic link to myvimrc
if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then
    mv -v ~/.vimrc ~/.vimrc.org
fi
ln -sv $PWD/vimrc/.vimrc ~/.vimrc
# plugin install
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    vim +PluginInstall +qall
fi
# setup youcompleteme, require package install using vundle
if [ -e $PWD/.setup_youcompleteme.sh ]; then
    source $PWD/.setup_youcompleteme.sh
fi
