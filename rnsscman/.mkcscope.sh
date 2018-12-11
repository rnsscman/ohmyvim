#!/bin/sh

if [ -e cscope.files ]; then
    rm -v cscope.files
fi

find . \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name    '*.S' \) -print > cscope.files

if [ -e cscope.files ]; then
    cscope -i cscope.files
fi
