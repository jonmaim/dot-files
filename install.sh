#!/bin/bash
# Get the directorty of the install script.
DIR=`dirname $0`
cd $DIR;
git submodule update --init --recursive
ln -sf $DIR/.vim
ln -sf $DIR/.vimrc
ln -sf $DIR/.bashrc
ln -sf $DIR/.inputrc
ln -sf $DIR/.aliases
ln -sf $DIR/.scripts
ln -sf $DIR/.screenrc
