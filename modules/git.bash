# Sets up the git configuration files.

load-git() {
  [ -f ~/.bash/.run-once ] && return

  if [ ! -e ~/.gitconfig ]; then
    cp ~/.bash/files/git/.gitconfig ~/
  fi

  if [ ! -e ~/.gitignore ]; then
    cp ~/.bash/files/git/.gitignore ~/
  fi
}
