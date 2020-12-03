# Editor Config
export EDITOR='vim'
alias e="vim"

PS1_COLOR="\[\e[92m\]"
PS1_COLOR_CLEAR="\[\e[0m\]"
PS1="${PS1_COLOR}\w\n${PS1_COLOR_CLEAR}λ "

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Go
export GOPATH=$HOME/go
export PATH="$PATH:/usr/local/opt/go/bin"

# Docker
alias dc="docker-compose"

# Tokens + hidden config specific to the current machine
if [ -f ~/.tokens ]
then
  source ~/.tokens
fi

# Lists are easier to grok
alias ll='ls -l'

# Git
git-reset-local() {
  git checkout master;
  git pull;
  # @TODO: Maybe change to -D (force regardless of merge status)
  git branch | grep -v "master" | xargs git branch -d;
  git stash clear;
  git fetch --prune;
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Remove Catalina Zshell message
export BASH_SILENCE_DEPRECATION_WARNING=1

zoom() {
  invite="Join my Zoom meeting!\n\nUrl: $ZOOM_URL"

  if [ -n "$ZOOM_PASS" ]
  then
    invite+="\nPass: $ZOOM_PASS"
  fi

  echo -e $invite | pbcopy
  open -a "/Applications/zoom.us.app" $ZOOM_URL
}


# FZF - Always show hidden files, ignore .git and respect .gitignore
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
