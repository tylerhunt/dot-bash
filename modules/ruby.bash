load-ruby() {
  # Load rbenv, assuming is was installed via Homebrew.
  if is-executable rbenv ; then
    eval "$(rbenv init -)"
  fi

  # List of commands that shouldn't use rubygems-bundler.
  export NOEXEC_EXCLUDE="powder"

  # Aliases
  alias frspec="rspec --only-failures"
  alias ffrspec="rspec --next-failure"
}
