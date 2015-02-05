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
./brew

# Finish install with the min.sh
./apm-install.sh
./min.sh
