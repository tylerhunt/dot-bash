load-direnv() {
  is-executable direnv || return 1

  if is-executable asdf ; then
    # NOTE: add 'use asdf' to .envrc files to utilize asdf-direnv
    if [ -z "$(asdf plugin list | grep direnv)" ]; then
      asdf plugin-add direnv
      asdf global direnv system
    fi
  fi

  eval "$(direnv hook bash)"

  # load asdf-direnv
  if [ -d "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv" ]; then
    source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc"
  fi
}
