#!/bin/sh

if [[ $OSTYPE == 'linux-gnu' ]]; then
    . ./.setup_for_linux.sh
elif [[ $OSTYPE == *'darwin'* ]]; then
    . ./.setup_for_darwin.sh
elif [[ $OSTYPE == 'cygwin' ]]; then
    . ./.setup_for_cygwin.sh
else
    echo 'This OS is not supported'
fi
