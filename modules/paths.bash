load-paths() {
  if [ -d ~/.bin ]; then
    export PATH="~/.bin:${PATH}"
  fi

  if [ -d ~/.rbenv/bin ]; then
    export PATH="~/.rbenv/bin:${PATH}"
  fi
}
