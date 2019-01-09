#!/bin/sh

if [ -e cscope.out ]; then
    rm -v cscope.out
fi

if [ -e GPATH ] || [ -e GRTAGS ] || [ -e GTAGS ]; then
    rm -v G*
fi
gtags

if [ -e tags ]; then
    rm -v tags
fi

if [ $# -eq 0 ]; then
    ctags -R
    if [ -e ~/.local/bin/mkcscope.sh ]; then
        mkcscope.sh
    fi
else
    make tags ARCH=$1
    if [ -e ~/.local/bin/mkcscope.sh ]; then
        mkcscope.sh $1
    fi
fi
