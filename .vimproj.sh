#!/bin/sh

function tag_clear() {
    if [ -e tags ]; then
		rm -v tags
	fi
	if [ -e ctags ]; then
		rm -v ctags
	fi
	if [ -e GPATH ]; then
		rm -v GPATH
	fi
	if [ -e GRTAGS ]; then
		rm -v GRTAGS
	fi
	if [ -e GTAGS ]; then
		rm -v GTAGS
	fi
}

if [ $# -eq 0 ]; then
    tag_clear
    ctags --sort=foldcase -R
    gtags
else
    if [ "$1" = "arm" ]; then
        tag_clear
        if [ ! -e .config ]; then
            make menuconfig
        fi
        make tags ARCH=$1
        gtags
    elif [ "$1" = "clean" ]; then
        tag_clear
    fi
fi
