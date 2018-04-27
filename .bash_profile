# Editor Config
export EDITOR='subl -w'
alias e="subl"

PS1_COLOR="\e[33m"
PS1_CONTENT="λ [\W]: "
PS1_COLOR_CLEAR="\033[0m"

PS1=$PS1_COLOR$PS1_CONTENT$PS1_COLOR_CLEAR

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Ruby
eval "$(rbenv init -)"

# Go
export GOPATH="$HOME/Sites/go"

# Docker
alias dc="docker-compose"
