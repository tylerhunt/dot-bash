load-asdf() {
  [ ! -d ~/.asdf ] && return 1

  export POSTGRES_EXTRA_CONFIGURE_OPTIONS="--with-uuid=e2fs --with-openssl --with-libraries=/usr/local/lib:/usr/local/opt/openssl@1.1/lib --with-includes=/usr/local/include:/usr/local/opt/openssl@1.1/include"

  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
}
