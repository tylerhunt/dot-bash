load-direnv() {
  is-executable direnv || return 1

  eval "$(direnv hook bash)"

  # load asdf-direnv
  if [ -d "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv" ]; then
    source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc"
  fi
}
