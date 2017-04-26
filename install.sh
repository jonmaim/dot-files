#!/bin/bash

# should be executed from your home directory root

# get the directory of the install script
DIR=`dirname $0`
cd $DIR
git submodule update --init --recursive;
# vim vundle install
[ ! -d "./vim/bundle/Vundle.vim" ] || git clone https://github.com/gmarik/Vundle.vim.git .vim/bundle/Vundle.vim
vim +BundleInstall +qall
cd -
ln -sf $DIR/.vim
ln -sf $DIR/.vimrc
ln -sf $DIR/.bashrc
ln -sf $DIR/.zshrc
ln -sf $DIR/.inputrc
ln -sf $DIR/.aliases
ln -sf $DIR/.scripts
ln -sf $DIR/.screenrc
ln -sf $DIR/.fonts

# tern setup
cd .vim/bundle/tern_for_vim;
npm install;

# YouCompleteMe setup
cd ../YouCompleteMe;

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install build-essential cmake python-dev zsh
  ./install.sh
elif [[ "$OSTYPE" == "darwin"* ]]; then
  ./install.py --clang-completer --tern-completer
fi
