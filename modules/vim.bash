# Sets up the vim configuration files.

load-vim() {
  if [ ! -e ~/.vimrc ]; then
    cp vim/.vimrc ~/
  fi
}
