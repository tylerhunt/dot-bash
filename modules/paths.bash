load-paths() {
  export PATH="/usr/local/bin:${PATH}"
  export PATH="/usr/local/sbin:${PATH}"

  if [ -d /usr/local/heroku/bin ]; then
    export PATH="/usr/local/heroku/bin:${PATH}"
  fi

  if [ -d ~/.bin ]; then
    export PATH="~/.bin:${PATH}"
  fi
}
