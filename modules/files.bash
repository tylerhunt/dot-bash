load-files() {
  [ -f ~/.bash/.run-once ] && return

  cp -Rn ~/.bash/files/ ~/

  return 0
}
