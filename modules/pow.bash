# Sets up the Pow configuration files.

load-pow() {
  [ -f ~/.bash/.run-once ] && return

  if [ ! -e ~/.powconfig ]; then
    cp ~/.bash/files/pow/.powconfig ~/
  fi
}
