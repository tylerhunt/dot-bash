load-rvm() {
  if [[ -s ~/.rvm/scripts/rvm ]]; then
    source ~/.rvm/scripts/rvm
  else
    return 1
  fi
}
