#!/bin/sh

# setup vim
INSTALLED=$(command -v vim)
# check vim installed
if [ -z $INSTALLED ]; then
    if [ $OSTYPE == 'linux-gnu' ]; then
        sudo apt install vim
    fi
fi

# setup gtags
if [ -e .setup_gtags.sh ]; then
    . ./.setup_gtags.sh
fi

# setup vundle
echo "setup vundle:"
mkdir -pv ~/.vim/bundle
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    if [ -d ~/.vim/bundle/Vundle.vim.org ]; then
        rm -frv ~/.vim/bundle/Vundle.vim.org
    fi
    mv -v ~/.vim/bundle/Vundle.vim ~/.vim/bundle/Vundle.vim.org
fi
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# setup vimrc
echo "setup vimrc:"
# make myvimrc
echo "let \$vimsetuproot = "\"$PWD\" > vimrc/.vimrc
cat vimrc/.vimrc.org >> vimrc/.vimrc
if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then
    if [ -e ~/.vimrc.org ] || [ -L ~/.vimrc.org ]; then
        rm -v ~/.vimrc.org
    fi
    mv -v ~/.vimrc ~/.vimrc.org
fi
# make .vimrc in home symbolic link to myvimrc
ln -sv $PWD/vimrc/.vimrc ~/.vimrc # why not work '.' after 'ln', so '$PWD' is used

# plugin install
echo "setup plugin..."
if [ -d ~/.vim/bundle/Vundle.vim ]; then
    vim +PluginInstall +qall
fi

# setup youcompleteme, require package install using vundle
# echo "setup youcompleteme:"
# if [ -e .setup_youcompleteme.sh ]; then
#     . ./.setup_youcompleteme.sh
# fi

# setup vimproj
echo "setup vimproj:"
mkdir -pv ~/.local/bin
# copy user tool for vim
if [ -e .vimproj.sh ] || [ ! -e ~/.local/bin/vimproj.sh ]; then
    cp -v .vimproj.sh ~/.local/bin/vimproj.sh 
fi
