load-homebrew() {
  is-executable brew || return 1

  local brew_completion="$(brew --prefix)/etc/bash_completion"

  [ -f $brew_completion ] && source $brew_completion
}
