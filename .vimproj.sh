#!/bin/sh

if [ $# -eq 0 ]; then
    if [ -e tags ]; then
        rm -v tags
    fi
    ctags -R
    if [ -e GPATH ] || [ -e GRTAGS ] || [ -e GTAGS ]; then
        rm -v G*
    fi
    gtags
    if [ -e ~/.local/bin/mkcscope.sh ]; then
        if [ -e cscope.out ]; then
            rm -v cscope.out
        fi
        mkcscope.sh
    fi
else
    echo "not defined"
fi
