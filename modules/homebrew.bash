load-homebrew() {
  is-executable brew || return 1

  local brew_completion="$(brew --prefix)/etc/profile.d/bash_completion.sh"

  [ -f $brew_completion ] && source $brew_completion
}
