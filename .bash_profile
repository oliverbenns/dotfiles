# Editor Config
export EDITOR='vim'
alias e="vim"
# Vim keys in Bash
set -o vi

if [[ "$TERM" =~ 256color ]]; then
  # https://github.com/tomasr/molokai/blob/master/colors/molokai.vim#L163
  # https://robotmoon.com/256-colors/
  PS1_COLOR="\[\e[38;5;118m\]"
else
  PS1_COLOR="\[\e[32m\]"
fi

PS1_COLOR_CLEAR="\[\e[0m\]"
PS1="${PS1_COLOR}\w\n${PS1_COLOR_CLEAR}λ "

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Go
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

# Docker
alias dc="docker-compose"

# Tokens + hidden config specific to the current machine
if [ -f ~/.tokens ]
then
  source ~/.tokens
fi

# Lists are easier to grok, and show hidden files
alias ls='ls -la'

# Git
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


# Postgres
alias pg-start="pg_ctl -D /usr/local/var/postgres start"
alias pg-stop="pg_ctl -D /usr/local/var/postgres stop"

# Brew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Direnv
eval "$(direnv hook bash)"
