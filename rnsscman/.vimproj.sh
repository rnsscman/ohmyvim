#!/bin/sh

if [ $# -eq 0 ]; then
    ctags -R
    gtags
    if [ -e ~/.local/bin/mkcscope.sh ]; then
        mkcscope.sh
    fi
else
    echo "not defined"
fi
