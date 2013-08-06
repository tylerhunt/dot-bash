load-paths() {
  export PATH="/usr/local/bin:${PATH}"
  export PATH="/usr/local/sbin:${PATH}"

  if [ -d ~/.bin ]; then
    export PATH="~/.bin:${PATH}"
  fi
}
