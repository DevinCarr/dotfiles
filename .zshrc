HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

export EDITOR=vim

for file in ~/.zsh/*.zsh
do
    source $file
done
