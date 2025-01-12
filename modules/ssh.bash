load-ssh() {
  local ssh_ident_dir="${HOME}/.bin/ssh-ident"

  if [ ! -d ~/.bin/ssh-ident ]; then
    git clone https://github.com/ccontavalli/ssh-ident.git "${ssh_ident_dir}"
  fi

  alias ssh='ssh_ident'
  alias scp='BINARY_SSH=scp ssh_ident'
  alias sftp='BINARY_SSH=sftp ssh_ident'
}
