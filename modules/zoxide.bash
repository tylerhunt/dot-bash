load-zoxide() {
  is-executable zoxide || return 1

  eval "$(zoxide init bash)"
}
