load-asdf() {
  [ ! -d ~/.asdf ] && return 1

  export KERL_CONFIGURE_OPTIONS="--disable-debug --disable-silent-rules --without-javac --enable-shared-zlib --enable-dynamic-ssl-lib --enable-hipe --enable-smp-support --enable-threads --enable-kernel-poll --enable-wx --enable-darwin-64bit --with-ssl=$(brew --prefix openssl)"
  export POSTGRES_EXTRA_CONFIGURE_OPTIONS="--with-uuid=e2fs --with-openssl --with-libraries=/usr/local/lib:/usr/local/opt/openssl@1.1/lib --with-includes=/usr/local/include:/usr/local/opt/openssl@1.1/include"

  . $(brew --prefix)/opt/asdf/libexec/asdf.sh
  . $(brew --prefix)/etc/bash_completion.d/asdf.bash

  # Bash completion for binaries provided by asdf plugins
  if is-executable brew ; then
    local POSTGRESQL_COMPLETION="$(brew --prefix)/etc/bash_completion.d/postgresql"

    if [ -f $POSTGRESQL_COMPLETION ]; then
      have() {
        unset -v have
        asdf plugin list | grep postgres > /dev/null && have="yes"
      }

      . $POSTGRESQL_COMPLETION
    fi
  fi
}
