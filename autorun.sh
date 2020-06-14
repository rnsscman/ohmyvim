#!/bin/bash

if [[ "$OSTYPE" == *"darwin"* ]]; then
    ./setupDarwin.sh
elif [ "$OSTYPE" = "linux-gnu" ]; then
    ./setupLinux.sh
elif [ "$OSTYPE" = "cygwin" ] || [ "$OSTYPE" = "msys" ]; then
    ./setupWindows.sh
else
    echo "This OS is NOT supported !"
    exit 1
fi
