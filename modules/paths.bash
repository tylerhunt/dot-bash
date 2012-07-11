load-paths() {
  if [ -d ~/.bin ]; then
    export PATH="~/.bin:${PATH}"
  fi
}
