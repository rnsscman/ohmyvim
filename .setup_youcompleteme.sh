#!/bin/sh

# if [ -e $PWD/plugin_script/.ycm_extra_conf.py ]; then
#     if [ -e ~/.vim/plugin/.ycm_extra_conf.py ]; then
#         mv -v ~/.vim/plugin/.ycm_extra_conf.py ~/.vim/plugin/.ycm_extra_conf.py.org
#     fi
#     cp -v $PWD/plugin_script/.ycm_extra_conf.py ~/.vim/plugin/.ycm_extra_conf.py
# fi

if [ $OSTYPE == "linux-gnu" ]; then
    if [ -e $PWD/plugin_script/.youcompleteme.vim ]; then
        dpkg -s build-essential &> /dev/null
        if [ $? -ne 0 ]; then
            sudo apt install build-essential
        fi
        dpkg -s cmake &> /dev/null
        if [ $? -ne 0 ]; then
            sudo apt install cmake
        fi
        dpkg -s python3-dev &> /dev/null
        if [ $? -ne 0 ]; then
            sudo apt install python3-dev
        fi
        mkdir -pv ~/.vim/bundle
        if [ -d ~/.vim/bundle/youcompleteme ]; then
            if [ -e ~/.vim/bundle/youcompleteme/install.py ]; then
                echo "Compiling YCM with semantic support for C-family languages:"
                python3 ~/.vim/bundle/youcompleteme/install.py --clang-completer
            fi
        fi
    fi
elif [ $OSTYPE == "darwin" ]; then
    echo "not defined on mac"
elif [ $OSTYPE == "cygwin" ]; then
    echo "not defined on cygwin"
elif [ $OSTYPE == "msys" ]; then
    echo "not defined on mingw"
fi
