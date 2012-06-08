#!/bin/bash
cd ~/dot-files
git submodule update --init --recursive
cd ~
ln -sf dot-files/.vim
ln -sf dot-files/.vimrc
ln -sf dot-files/.bashrc
ln -sf dot-files/.aliases
ln -sf dot-files/.scripts
