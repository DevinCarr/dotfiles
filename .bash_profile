# Load the shell dotfiles
for file in ~/.{path,exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# console prompt
gitdirty() {
  local status=$(git status --porcelain 2> /dev/null)
  if [[ "$status" != "" ]]; then
    git_dirty='*'
  else
    git_dirty=' '
  fi
}

gitcheck() {
  local branch
  if branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null); then
    if [[ "$branch" == "HEAD" ]]; then
      branch='detached*'
    fi
    git_branch="($branch)"
  else
    git_branch=""
  fi
}

PROMPT_COMMAND="gitcheck; gitdirty; $PROMPT_COMMAND"
export PS1="\T[\u]:\W\$git_branch\$git_dirty$ "

# avoid duplicates and lines with starting spaces
export HISTCONTROL=erasedups:ignorespace
# append history entries..
shopt -s histappend
# large history
export HISTSIZE=1000
export HISTFILESIZE=2000

# set gopath
export GOPATH=$HOME/Documents/github/go
export PATH=$PATH:$GOPATH/bin

# add adb
export PATH=$PATH:$HOME/Library/android/sdk/platform-tools/
export PATH=$PATH:$HOME/andromeda/Library/android/sdk/tools/
