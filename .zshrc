# Editor Config
export EDITOR='cursor'
alias e="cursor"

# Prompt
PROMPT_COLOR='%F{118}'
PROMPT_COLOR_CLEAR='%f'
PROMPT="${PROMPT_COLOR}%~${PROMPT_COLOR_CLEAR}
λ "

# Nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

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

# Cursor agent
export PATH="$HOME/.local/bin:$PATH"

# Libpq
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"'