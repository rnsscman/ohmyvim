#!/bin/sh

# setup gtags
if [ -e .setup_gtags.sh ]; then
    . ./.setup_gtags.sh
fi

if [ -d ~/.vim/bundle/Vundle.vim ]; then
    vim +PluginClean +qall
    vim +PluginInstall +qall
fi

# setup vimproj
echo "setup vimproj:"
mkdir -pv ~/.local/bin
# copy user tool for vim
if [ -e .vimtags ] || [ ! -e ~/.local/bin/vimtags ]; then
    cp -v .vimtags ~/.local/bin/vimtags
fi
