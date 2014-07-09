#!/usr/bin/env bash

# Minimal install with only the dotfiles
# Move the dotfiles
for file in ./.{aliases,functions,bash_profile,bashrc}; do
	cp $file $HOME;
done

# Reload the terminal with the new bash_profile
source ~/.bash_profile
exec $SHELL -l
