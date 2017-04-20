load-paths() {
  export PATH="/usr/local/bin:${PATH}"
  export PATH="/usr/local/sbin:${PATH}"

  if [ -d ~/.bin ]; then
    export PATH="~/.bin:${PATH}"
  fi

  export PATH="./.bundle/bin:${PATH}"
  export PATH="./node_modules/.bin:${PATH}"
  export PATH="$(yarn global bin):${PATH}"
}
