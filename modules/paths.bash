load-paths() {
  export PATH="~/.bash/commands:${PATH}"

  export PATH="/usr/local/bin:${PATH}"
  export PATH="/usr/local/sbin:${PATH}"

  if [ -d ~/.bin ]; then
    export PATH="~/.bin:${PATH}"
  fi

  export PATH="./.bundle/bin:${PATH}"
  export PATH="./node_modules/.bin:${PATH}"
}
