load-asdf() {
  [ ! -d ~/.asdf ] && return 1

  export KERL_CONFIGURE_OPTIONS="--with-ssl=`brew --prefix openssl@3` --with-wx-config=`brew --prefix wxwidgets`/bin/wx-config --without-javac --without-odbc"

  export POSTGRES_EXTRA_CONFIGURE_OPTIONS="--with-uuid=e2fs --with-openssl --with-libraries=/usr/local/lib:$(brew --prefix)/opt/openssl/lib --with-includes=/usr/local/include:$(brew --prefix)/opt/openssl/include"

  export REDIS_APPLY_PATCHES=https://patch-diff.githubusercontent.com/raw/redis/redis/pull/12611.diff

  # LDFLAGS="-L$(brew --prefix icu4c)" \
  #   PKG_CONFIG_PATH="$(brew --prefix icu4c)/lib/pkgconfig" \
  #   asdf install postgres

  # load asdf
  if [ -d "${ASDF_DATA_DIR:-$HOME/.asdf}" ]; then
    export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
  fi

  # Bash completions
  if is-executable asdf ; then
    . <(asdf completion bash)
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
