#!/bin/sh

#setup symlinks
CURRENT=$(pwd) 

ln -s $CURRENT/bash_profile ~/.bash_profile
ln -s $CURRENT/bashrc ~/.bashrc
ln -s $CURRENT/vimrc ~/.vimrc
ln -s $CURRENT/gvimrc ~/.gvimrc
ln -s $CURRENT/vim ~/.vim
ln -s $CURRENT/gemrc ~/.gemrc

exit 0
