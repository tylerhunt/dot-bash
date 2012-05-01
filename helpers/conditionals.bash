#!/bin/bash

is-executable() {
  local FILE=`which $1`

  [[ $FILE && -x $FILE ]]
}

is-mac-os() {
  if [ $1 ]; then
    if is-executable sw_vers; then
      local VERSION=(`sw_vers -productVersion | sed -e 's/\./ /g'`)
    fi

    is-mac-os && [[ ${VERSION[0]} -ge $1 ]] && [[ -z $2 || ${VERSION[1]} -ge $2 ]] && [[ -z $3 || ${VERSION[2]} -ge $3 ]]
  else
    if is-executable uname; then
      local SYSTEM=`uname -s`
    fi

    [[ $SYSTEM == "Darwin" ]]
  fi
}

is-mac-os-leopard() {
  is-mac-os 10 5
}

has-ruby() {
  is-executable ruby
}

has-ruby-gem() {
  if has-ruby && is-executable gem; then
    gem list $1 | grep $1
  fi
}
