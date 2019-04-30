#!/bin/sh

if [ $OSTYPE == 'linux-gnu' ]; then
    . ./.setup_for_linux.sh
elif [ $OSTYPE == 'cygwin' ]; then
    . ./.setup_for_cygwin.sh
elif [ $OSTYPE == 'darwin' ]; then
    . ./.setup_for_darwin.sh
fi
