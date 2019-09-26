load-asdf() {
  if [ ! -d ~/.asdf ]; then return 1; fi

  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
}
