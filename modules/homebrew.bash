load-homebrew() {
  export PATH="/opt/homebrew/bin:${PATH}"
  export PATH="/opt/homebrew/sbin:${PATH}"

  is-executable brew || return 1

  local brew_completion="$(brew --prefix)/etc/profile.d/bash_completion.sh"

  [ -f $brew_completion ] && source $brew_completion
}
