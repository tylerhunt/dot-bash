load-paths() {
  if [ -d ~/Scripts ]; then
    export PATH="~/Scripts:${PATH}"
  fi

  if [ -d ~/bin ]; then
    export PATH="~/bin:${PATH}"
  fi

  if [ -d /usr/local/mysql/bin ]; then
    export PATH="/usr/local/mysql/bin:${PATH}"
  fi

  if [ -d /usr/local/pgsql/bin ]; then
    export PATH="/usr/local/pgsql/bin:${PATH}"
  fi

  if [ -d /usr/local/man ]; then
    export MANPATH="/usr/local/man:${MANPATH}"
  fi

  if [ -d /usr/local/pgsql/data ]; then
    export PGDATA='/usr/local/pgsql/data'
  fi
}
