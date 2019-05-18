load-node() {
  [ ! -f "/usr/local/opt/nvm/nvm.sh" ] && return

  # Set nvm path.
  export NVM_DIR="$HOME/.nvm"

  # Load nvm.
  source "/usr/local/opt/nvm/nvm.sh"
}
