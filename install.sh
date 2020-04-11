#!/bin/bash

USE_PLUGIN=0
if [[ "$OSTYPE" == *"darwin"* ]]; then
    if [ ! "$(command -v brew)" ]; then
        echo "[error] brew is not installed"
        exit 1
    fi
    USE_PLUGIN=1
    brew install vim
elif [ "$OSTYPE" = "linux-gnu" ]; then
    USE_PLUGIN=1
    sudo apt install vim-gnome
elif [ "$OSTYPE" = "cygwin" ]; then
    if [ ! "$(command -v apt-cyg)" ]; then
        echo "[error] apt-cyg is not installed"
        exit 1
    fi
    apt-cyg install vim
elif [ "$OSTYPE" = "msys" ]; then
    echo "no requirement"
else
    echo "[error] This OS is not supported"
    exit 1
fi

if [ "$USE_PLUGIN" -ne 0 ]; then
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
        # THEME
        if [ ! -d ~/.vim/bundle/gruvbox ]; then
            git clone https://github.com/morhetz/gruvbox.git
        fi
        if [ ! -d ~/.vim/bundle/onehalf ]; then
            git clone https://github.com/sonph/onehalf.git
        fi
        if [ ! -d ~/.vim/bundle/vim-colors-solarized ]; then
            git clone https://github.com/altercation/vim-colors-solarized.git
        fi
        # OTHERS
        if [ ! -d ~/.vim/bundle/ctrlp.vim ]; then
            git clone https://github.com/kien/ctrlp.vim
        fi
        if [ ! -d ~/.vim/bundle/indentline ]; then
            git clone https://github.com/yggdroot/indentline
        fi
        if [ ! -d ~/.vim/bundle/nerdcommenter ]; then
            git clone https://github.com/scrooloose/nerdcommenter
        fi
        if [ ! -d ~/.vim/bundle/nerdtree ]; then
            git clone https://github.com/scrooloose/nerdtree
        fi
        if [ ! -d ~/.vim/bundle/rainbow_parentheses.vim ]; then
            git clone https://github.com/kien/rainbow_parentheses.vim.git
        fi
        if [ ! -d ~/.vim/bundle/tagbar ]; then
            git clone https://github.com/majutsushi/tagbar
        fi
        if [ ! -d ~/.vim/bundle/vim-airline ]; then
            git clone https://github.com/vim-airline/vim-airline
        fi
        if [ ! -d ~/.vim/bundle/vim-airline-themes ]; then
            git clone https://github.com/vim-airline/vim-airline-themes
        fi
        if [ ! -d ~/.vim/bundle/vim-bookmarks ]; then
            git clone https://github.com/MattesGroeger/vim-bookmarks.git
        fi
        if [ ! -d ~/.vim/bundle/vim-easymotion ]; then
            git clone https://github.com/easymotion/vim-easymotion
        fi
        if [ ! -d ~/.vim/bundle/vim-fugitive ]; then
            git clone https://github.com/tpope/vim-fugitive
        fi
        if [ ! -d ~/.vim/bundle/vim-gitgutter ]; then
            git clone https://github.com/airblade/vim-gitgutter
        fi
        if [ ! -d ~/.vim/bundle/vim-signature ]; then
            git clone https://github.com/kshenoy/vim-signature.git
        fi
        cd -
    fi
    if [ ! "$(command -v gtags)" ] ||
        [ ! -e ~/.vim/plugin/gtags.vim ] ||
        [ ! -e ~/.vim/plugin/gtags-cscope.vim ]; then
        # gtags install
        if [ -e ./.setup_gtags.sh ]; then
            source ./.setup_gtags.sh
        fi
    fi
fi

# .vimrc install
if [ -d ./vimrc ]; then
    echo "let \$myvimrootdir= "\"$PWD\" > vimrc/.vimrc
    if [ -e ./vimrc/profile.vim ]; then
        echo "source \$myvimrootdir/vimrc/profile.vim" >> vimrc/.vimrc
    fi
    if [ -e ./vimrc/key_mapping.vim ]; then
        echo "source \$myvimrootdir/vimrc/keymap.vim" >> vimrc/.vimrc
    fi
    if [ "$USE_PLUGIN" -ne 0 ] && [ -e ./vimrc/plugin_config.vim ]; then
        echo "source \$myvimrootdir/vimrc/plugin_config.vim" >> vimrc/.vimrc
    fi
    echo '" clipboard' >> vimrc/profile.vim
    if [[ "$OSTYPE" == *"darwin"* ]]; then
        echo "set clipboard=unnamed" >> vimrc/profile.vim
    elif [ "$OSTYPE" = "linux-gnu" ]; then
        echo "set clipboard=unnamedplus" >> vimrc/profile.vim
    fi
    # why not work '.' after 'ln', so '$PWD' is used
    ln -svf $PWD/vimrc/.vimrc ~/.vimrc
fi
