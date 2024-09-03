load-paths() {
  export PATH="${HOME}/.bash/commands:${PATH}"

  if [ -d ~/.bin ]; then
    export PATH="${HOME}/.bin:${PATH}"
  fi

  export PATH="./.bundle/bin:${PATH}"
  export PATH="./node_modules/.bin:${PATH}"
}
