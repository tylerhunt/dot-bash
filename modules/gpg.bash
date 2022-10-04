# Based on https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b.

load-gpg() {
  is-executable gpg-agent || return 1

  # start gpg-agent if it isn’t running
  if [ ! -S ~/.gnupg/S.gpg-agent ] && [ -z "$(pgrep gpg-agent)" ]; then
    gpg-agent --daemon
  fi

  # define TTY for interactive GPG commands
  export GPG_TTY=$(tty)
}
