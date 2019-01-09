#!/bin/sh

if [ -e cscope.files ]; then
    rm -v cscope.files
fi

find . \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name '*.S' \) -print > cscope.files

if [ $# -eq 0 ]; then
    if [ -e cscope.files ]; then
        cscope -i cscope.files
    fi
else
    if [ -e cscope.files ]; then
        make cscope ARCH=$1
    fi
fi
