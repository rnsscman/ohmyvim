#!/bin/bash

use_plugin=false
if [[ "$OSTYPE" == *"darwin"* ]]; then
    if [ -z "$(command -v brew)" ]; then
        echo "brew is NOT installed!"
        exit 1
    fi
    use_plugin=true
    brew install vim curl
elif [ "$OSTYPE" = "linux-gnu" ]; then
    use_plugin=true
    sudo apt install vim-gtk3 curl
elif [ "$OSTYPE" = "cygwin" ]; then
    if [ -z "$(command -v apt-cyg)" ]; then
        echo "apt-cyg is NOT installed!"
        exit 1
    fi
    apt-cyg install vim
elif [ "$OSTYPE" = "msys" ]; then
    :
else
    echo "This OS is NOT supported!"
    exit 1
fi

if [ "$use_plugin" = "true" ]; then
    if [ -z "$(command -v curl)" ]; then
        echo "curl is NOT installed!"
        exit 1
    fi

    # plugin manager install
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    # plugin install
    if [ -d ~/.vim/bundle ]; then
        cd ~/.vim/bundle
        # airline
        if [ ! -d ~/.vim/bundle/airline ]; then
            git clone https://github.com/vim-airline/vim-airline airline
        fi
        # airline-themes
        if [ ! -d ~/.vim/bundle/airline-themes ]; then
            git clone https://github.com/vim-airline/vim-airline-themes airline-themes
        fi
        # bookmarks
        if [ ! -d ~/.vim/bundle/bookmarks ]; then
            git clone https://github.com/MattesGroeger/vim-bookmarks.git bookmarks
        fi
        # coc.nvim
        if [ ! -d ~/.vim/pack/coc/start ]; then
            if [ -d ~/GitHub/vim/script ] && [ -f ~/GitHub/vim/script/setup_coc.sh ]; then
                ~/GitHub/vim/script/setup_coc.sh
            fi
        fi
        # ctrlp
        if [ ! -d ~/.vim/bundle/ctrlp ]; then
            git clone https://github.com/kien/ctrlp.vim ctrlp
        fi
        # dracula
        if [ ! -d ~/.vim/bundle/dracula ]; then
            git clone https://github.com/dracula/vim dracula
        fi
        # easymotion
        if [ ! -d ~/.vim/bundle/easymotion ]; then
            git clone https://github.com/easymotion/vim-easymotion easymotion
        fi
        # fugitive
        if [ ! -d ~/.vim/bundle/fugitive ]; then
            git clone https://github.com/tpope/vim-fugitive fugitive
        fi
        # gitgutter
        if [ ! -d ~/.vim/bundle/gitgutter ]; then
            git clone https://github.com/airblade/vim-gitgutter gitgutter
        fi
        # indentline
        if [ ! -d ~/.vim/bundle/indentline ]; then
            git clone https://github.com/yggdroot/indentline indentline
        fi
        # nerdcommenter
        if [ ! -d ~/.vim/bundle/nerdcommenter ]; then
            git clone https://github.com/scrooloose/nerdcommenter nerdcommenter
        fi
        # nerdtree
        if [ ! -d ~/.vim/bundle/nerdtree ]; then
            git clone https://github.com/scrooloose/nerdtree nerdtree
        fi
        # signature
        if [ ! -d ~/.vim/bundle/signature ]; then
            git clone https://github.com/kshenoy/vim-signature.git signature
        fi
        # snippets
        if [ ! -d ~/.vim/bundle/snippets ]; then
            git clone https://github.com/honza/vim-snippets snippets
        fi
        # tagbar
        if [ ! -d ~/.vim/bundle/tagbar ]; then
            git clone https://github.com/majutsushi/tagbar tagbar
        fi
        cd -
    fi
    if [ -z "$(command -v gtags)" ] ||
        [ ! -f ~/.vim/plugin/gtags.vim ] ||
        [ ! -f ~/.vim/plugin/gtags-cscope.vim ]; then
        # gtags install
        if [ -f ./.setup_gtags.sh ]; then
            source ./.setup_gtags.sh
        fi
    fi
fi

# .vimrc install
if [ -d ./vimrc ]; then
    echo "let \$myvimrootdir= "\"$PWD\" > vimrc/.vimrc
    # profile
    if [ -f ./vimrc/profile.vim ]; then
        echo "source \$myvimrootdir/vimrc/profile.vim" >> vimrc/.vimrc
    fi
    # keymap
    if [ -f ./vimrc/keymap.vim ]; then
        echo "source \$myvimrootdir/vimrc/keymap.vim" >> vimrc/.vimrc
    fi
    # function
    if [ -f ./vimrc/function.vim ]; then
        echo "source \$myvimrootdir/vimrc/function.vim" >> vimrc/.vimrc
    fi
    # plugin_config
    if [ -f ./vimrc/plugin_config.vim ] && [ "$use_plugin" = "true" ]; then
        echo "source \$myvimrootdir/vimrc/plugin_config.vim" >> vimrc/.vimrc
    fi
    # clipboard
    if [[ "$OSTYPE" == *"darwin"* ]]; then
        echo "set clipboard=unnamed" >> vimrc/.vimrc
    elif [ "$OSTYPE" = "linux-gnu" ]; then
        echo "set clipboard=unnamedplus" >> vimrc/.vimrc
    fi
    # why not work '.' after 'ln', so '$PWD' is used
    ln -svf $PWD/vimrc/.vimrc ~/.vimrc
fi
