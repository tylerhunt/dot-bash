load-1password() {
  [ ! -d ~/.config/op ] && return 1

  source ~/.config/op/plugins.sh

  return 0
}
