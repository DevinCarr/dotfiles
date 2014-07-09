# Load the shell dotfiles
for file in ~/.{path,exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# avoid duplicates and lines with starting spaces
export HISTCONTROL=ignoredboth
# append history entries..
shopt -s histappend
# large history
export HISTSIZE=1000
export HISTFILESIZE=2000
