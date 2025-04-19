# Editor Config
export EDITOR='cursor'
alias e="cursor"

if [[ "$TERM" =~ 256color ]]; then
  # https://github.com/tomasr/molokai/blob/master/colors/molokai.vim#L163
  # https://robotmoon.com/256-colors/
  PROMPT_COLOR='%F{118}'
else
  PROMPT_COLOR='%F{green}'
fi

PROMPT_COLOR_CLEAR='%f'
PROMPT="${PROMPT_COLOR}%~${PROMPT_COLOR_CLEAR}
λ "

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# Go
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

# Tokens + hidden config specific to the current machine
if [ -f ~/.tokens ]; then
  source ~/.tokens
fi

# Lists are easier to grok, and show hidden files
alias ls='ls -la'

# Brew
export PATH=$PATH:/opt/homebrew/bin

# Direnv
eval "$(direnv hook zsh)"

function x() {
  git commit -m 'x'
} 