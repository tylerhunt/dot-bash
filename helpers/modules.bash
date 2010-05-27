#!/bin/bash

load-module() {
  load-$1

  if [[ $? == 0 ]]; then
    echo -n -e "${GREEN}•${WHITE}"
  else
    echo -n -e "${RED}•${WHITE}"
  fi
}

load-modules() {
  for SCRIPT in $(find $MODULES_DIR -name "*.bash" -type f); do
    . $SCRIPT
    load-module $(basename $SCRIPT | sed -e s/$(basename $EXTENSIONS_DIR)//)
  done

  echo
}

load-modules
