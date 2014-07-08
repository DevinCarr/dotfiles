#!/usr/bin/env bash
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
source .bash_profile
reload
brew bundle ./Brewfile
