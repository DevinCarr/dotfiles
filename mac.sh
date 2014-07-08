#!/usr/bin/env bash

# Full install with homebrew
# Check if Homebrew is installed
which -s brew
if [[ $? != 0 ]] ; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
else
	brew update
fi

# Run the Brewfile for more
brew bundle ./Brewfile

# Move the dotfiles
for file in ./.{aliases,functions,bash_profile}; do
	cp $file $HOME;
done

# Reload the terminal with the new bash_profile
source ~/.bash_profile
exec $SHELL -l
