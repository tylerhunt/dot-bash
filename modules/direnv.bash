load-direnv() {
  is-executable direnv || return 1

  eval "$(direnv hook bash)"
}
