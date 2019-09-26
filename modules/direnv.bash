load-direnv() {
  if ! is-executable direnv ; then return 1; fi

  eval "$(direnv hook bash)"
}
