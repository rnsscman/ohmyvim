#!/bin/bash

if [ "$OSTYPE" = "linux-gnu" ]; then
    sudo apt install vim-gnome
elif [[ "$OSTYPE" == *"darwin"* ]]; then
    if [ ! "$(command -v brew)" ]; then
        echo "[error] brew is not installed"
        exit 1
    fi
    brew install vim
elif [ "$OSTYPE" = "cygwin" ]; then
    if [ ! "$(command -v apt-cyg)" ]; then
        echo "[error] apt-cyg is not installed"
        exit 1
    fi
    apt-cyg install vim
else
    echo '[error] This OS is not supported'
    exit 1
fi

# plugin manager install
if [ ! "$(command -v curl)" ]; then
	echo "[error] curl is not installed"
	exit 1
fi

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# plugin install
if [ -d ~/.vim/bundle ]; then
    cd ~/.vim/bundle
    git clone https://github.com/kien/ctrlp.vim
    git clone https://github.com/scrooloose/nerdtree
    git clone https://github.com/scrooloose/nerdcommenter
    git clone https://github.com/majutsushi/tagbar
    git clone https://github.com/airblade/vim-gitgutter
if [ ! "$OSTYPE" = "cygwin" ]; then
	git clone https://github.com/vim-airline/vim-airline
    git clone https://github.com/vim-airline/vim-airline-themes
fi
    cd -
fi

# gtags install
if [ -e .setup_gtags.sh ]; then
    . ./.setup_gtags.sh
fi

# .vimrc install
if [ -d vimrc ] && [ -e vimrc/.vimrc.org ]; then
    echo "let \$myvimrootdir= "\"$PWD\" > vimrc/.vimrc
    cat vimrc/.vimrc.org >> vimrc/.vimrc
    # why not work '.' after 'ln', so '$PWD' is used
    ln -svf $PWD/vimrc/.vimrc ~/.vimrc 
fi
