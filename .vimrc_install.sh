#!/bin/bash

if [ -d vimrc ]; then
    scripts=(
        "profile.vim"
        "keymap.vim"
        "function.vim"
    )
    if [[ "$OSTYPE" == *"darwin"* ]]; then
        scripts+=("plugin_config.vim")
    elif [ "$OSTYPE" = "linux-gnu" ]; then
        scripts+=("plugin_config.vim")
    elif [ "$OSTYPE" = "cygwin" ]; then
        scripts+=("plugin_config_for_cygwin.vim")
    else
        # no plugin-config
        :
    fi

    echo "let \$vimconfig= "\"$PWD\" > vimrc/.vimrc
    if [ "$OSTYPE" = "linux-gnu" ]; then
        echo "set clipboard=unnamedplus" >> vimrc/.vimrc
    else
        echo "set clipboard=unnamed" >> vimrc/.vimrc
    fi
    for script in ${scripts[@]}; do
        if [ -f vimrc/$script ]; then
            echo "source \$vimconfig/vimrc/$script" >> vimrc/.vimrc
        fi
    done
    ln -svf $PWD/vimrc/.vimrc ~/.vimrc
fi

