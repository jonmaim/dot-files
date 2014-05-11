#!/bin/bash

# should be executed from your home directory root

# get the directory of the install script
DIR=`dirname $0`
pushd .
cd $DIR
git submodule update --init --recursive;
# vim vundle install
git clone https://github.com/gmarik/Vundle.vim.git bundle/vundle
vim +BundleInstall +qall
popd
ln -sf $DIR/.vim
ln -sf $DIR/.vimrc
ln -sf $DIR/.bashrc
ln -sf $DIR/.inputrc
ln -sf $DIR/.aliases
ln -sf $DIR/.scripts
ln -sf $DIR/.screenrc
