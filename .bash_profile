# Load the shell dotfiles
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups  
# append history entries..
shopt -s histappend
# large history
export HISTSIZE=1000

