# Load rbenv, assuming is was installed via Homebrew.

load-rbenv() {
  if is-executable rbenv ; then
    eval "$(rbenv init -)"
    alias re='rbenv'
  fi
}
