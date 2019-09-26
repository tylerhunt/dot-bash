load-asdf() {
  [ ! -d ~/.asdf ] && return 1

  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
}
