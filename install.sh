#!/bin/bash
# Get the directorty of the install script.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR;
git submodule update --init --recursive
cd ~
ln -sf $DIR/.vim
ln -sf $DIR/.vimrc
ln -sf $DIR/.bashrc
ln -sf $DIR/.aliases
ln -sf $DIR/.scripts
ln -sf $DIR/.screenrc
