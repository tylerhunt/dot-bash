# Sets up the Ruby configuration files.

load-ruby() {
  # Load rbenv, assuming is was installed via Homebrew.
  if is-executable rbenv ; then
    eval "$(rbenv init -)"
  fi

  [ -f ~/.bash/.run-once ] && return

  if [ ! -d ~/.bundle ]; then
    mkdir ~/.bundle
  fi

  if [ ! -e ~/.bundle/config ]; then
    cp ~/.bash/files/bundler/config ~/.bundle
  fi
}
