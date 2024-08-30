load-asdf() {
  [ ! -d ~/.asdf ] && return 1

  export KERL_CONFIGURE_OPTIONS="--with-ssl=`brew --prefix openssl@1.1` --with-wx-config=`brew --prefix wxwidgets`/bin/wx-config --without-javac --without-odbc"
  export POSTGRES_EXTRA_CONFIGURE_OPTIONS="--with-uuid=e2fs --with-openssl --with-libraries=/usr/local/lib:$(brew --prefix)/opt/openssl@1.1/lib --with-includes=/usr/local/include:$(brew --prefix)/opt/openssl@1.1/include"

  # load asdf
  if is-executable brew ; then
    source $(brew --prefix)/opt/asdf/libexec/asdf.sh
    source $(brew --prefix)/etc/bash_completion.d/asdf.bash
  else
    source ~/.asdf/asdf.sh
    source ~/.asdf/completions/asdf.bash
  fi

  # load asdf-direnv
  if [ -d "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv" ]; then
    source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/bashrc"
  fi

  # Bash completion for binaries provided by asdf plugins
  if is-executable brew ; then
    local POSTGRESQL_COMPLETION="$(brew --prefix)/etc/bash_completion.d/postgresql"

    if [ -f $POSTGRESQL_COMPLETION ]; then
      have() {
        unset -v have
        asdf plugin list 2>&1 | grep postgres > /dev/null && have="yes"
      }

      source $POSTGRESQL_COMPLETION
    fi
  fi

  return 0
}
