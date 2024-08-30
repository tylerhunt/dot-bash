load-homebrew() {
  is-executable /opt/homebrew/bin/brew || return 1

  eval "$(/opt/homebrew/bin/brew shellenv)"

  local brew_completion="$(brew --prefix)/etc/profile.d/bash_completion.sh"

  [ -f $brew_completion ] && source $brew_completion
}
