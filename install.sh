#!/bin/bash

# should be executed from your home directory root

# get the directory of the install script
DIR=`dirname $0`
cd $DIR
git submodule update --init --recursive;
# vim vundle install
[[ ! -d "./vim/bundle/vundle" ]] || git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/vundle
vim +BundleInstall +qall
cd -
ln -sf $DIR/.vim
ln -sf $DIR/.vimrc
ln -sf $DIR/.bashrc
ln -sf $DIR/.inputrc
ln -sf $DIR/.aliases
ln -sf $DIR/.scripts
ln -sf $DIR/.screenrc
ln -sf $DIR/.fonts

# YouCompleteMe setup
sudo apt-get install build-essential cmake python-dev
cd .vim/bundle/YouCompleteMe;
./install.sh
# tern setup
cd ../tern_for_vim;
npm install;
