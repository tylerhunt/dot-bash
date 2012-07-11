# Sets up the vim configuration files.

load-vim() {
  [ -f ~/.bash/.run-once ] && return

  if [ ! -e ~/.vimrc ]; then
    cp ~/.bash/files/vim/.vimrc ~/
  fi
}
