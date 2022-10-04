load-paths() {
  export PATH="~/.bash/commands:${PATH}"

  if [ -d ~/.bin ]; then
    export PATH="~/.bin:${PATH}"
  fi

  export PATH="./.bundle/bin:${PATH}"
  export PATH="./node_modules/.bin:${PATH}"
}
