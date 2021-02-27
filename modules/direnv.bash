load-direnv() {
  is-executable direnv || return 1

  if is-executable asdf ; then
    # NOTE: add 'use asdf' to .envrc files to utilize asdf-direnv
    if [ -z "$(asdf plugin list | grep direnv)" ]; then
      asdf plugin-add direnv
      asdf install direnv
      asdf global direnv system
      mkdir -p ~/.asdf/installs/direnv/system/env
    fi
  fi

  eval "$(direnv hook bash)"
}
