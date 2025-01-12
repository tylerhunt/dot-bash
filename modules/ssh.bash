load-ssh() {
  is-executable python3 || return 1

  local ssh_ident_dir="${HOME}/.bin/ssh-ident"

  if [ ! -d ~/.bin/ssh-ident ]; then
    git clone https://github.com/ccontavalli/ssh-ident.git "${ssh_ident_dir}"
    pushd "${ssh_ident_dir}"
    echo 'python 3.12.5' > .tool-versions
    asdf install
    popd
  fi

  eval "ssh_ident() {
    bash \
      --rcfile <(echo \"cd ${ssh_ident_dir}\") \
      -ci \"${ssh_ident_dir}/ssh-ident \$@\"
  }"

  alias ssh='ssh_ident'
  alias scp='BINARY_SSH=scp ssh_ident'
  alias sftp='BINARY_SSH=sftp ssh_ident'
}
