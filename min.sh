#!/usr/bin/env bash

# Minimal install with only the dotfiles
# Move the dotfiles
for file in ./.{aliases,functions,bash_profile,bashrc,atom}; do
	cp -R $file $HOME;
done

# Build home
./home-setup.sh

# Add atom as git editor
git config --global core.editor "atom --wait"

# Reload the terminal with the new bash_profile
source ~/.bash_profile
