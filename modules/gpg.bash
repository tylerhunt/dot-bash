# Based on https://gist.github.com/bmhatfield/cc21ec0a3a2df963bffa3c1f884b676b.

load-gpg() {
  # Load gpg-agent, assuming it was installed.
  if is-executable gpg-agent ; then
    if [ -f ~/.gnupg/.gpg-agent-info ] && [ -n "$(pgrep gpg-agent)" ]; then
      source ~/.gnupg/.gpg-agent-info
      export GPG_AGENT_INFO
    else
      eval $(gpg-agent --daemon)
    fi
  fi

  # Define TTY for interactive GPG commands.
  export GPG_TTY=$(tty)
}
