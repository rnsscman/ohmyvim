#!/bin/sh

mkdir -pv ~/.local/opt
if [ $# -eq 0 ]; then
    git clone https://github.com/rizsotto/Bear.git ~/.local/opt/Bear
    cd ~/.local/opt/Bear
else
    git clone https://github.com/rizsotto/Bear.git ~/.local/opt/$1
    cd ~/.local/opt/$1
fi
cmake CMakeLists.txt
sudo make all
sudo make install
sudo make check
sudo make package
cd -
