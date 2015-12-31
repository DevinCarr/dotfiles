#!/usr/bin/env bash

# Minimal install with only the dotfiles
# Move the dotfiles
for file in ./.{aliases,functions,bash_profile,bashrc,vim,vimrc}; do
	cp -R $file $HOME;
done

# Add vim as git editor
git config --global core.editor vim

# Reload the terminal with the new bash_profile
source ~/.bash_profile
