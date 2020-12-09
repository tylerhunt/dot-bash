load-ssh() {
  is-executable ssh-agent || return 1

  eval "$(ssh-agent -s)" > /dev/null
}
