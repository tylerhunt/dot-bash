load-ssh() {
  if [ ! -d ~/.bin/ssh-ident ]; then
    git clone https://github.com/ccontavalli/ssh-ident.git ~/.bin/ssh-ident
  fi

  alias ssh='asdf exec python ~/.bin/ssh-ident/ssh-ident'
  alias scp='BINARY_SSH=scp asdf exec python ~/.bin/ssh-ident/ssh-ident'
  alias sfpt='BINARY_SSH=sftp asdf exec python ~/.bin/ssh-ident/ssh-ident'
}
