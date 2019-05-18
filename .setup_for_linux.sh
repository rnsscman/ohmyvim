#!/bin/sh

PM_CMD='sudo apt'
$PM_CMD install vim git curl

# gtags install
if [ -e .setup_gtags.sh ]; then
    . ./.setup_gtags.sh
fi

# .vimrc install
if [ -d vimrc ]; then
    if [ -e vimrc/.vimrc.org ]; then
        echo "let \$myvimrootdir= "\"$PWD\" > vimrc/.vimrc
        cat vimrc/.vimrc.org >> vimrc/.vimrc
        if [ -e ~/.vimrc ] || [ -L ~/.vimrc ]; then
            rm -v ~/.vimrc
        fi
        ln -sv $PWD/vimrc/.vimrc ~/.vimrc # why not work '.' after 'ln', so '$PWD' is used
    fi
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
