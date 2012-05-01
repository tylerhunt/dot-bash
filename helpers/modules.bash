#!/bin/bash

load-module() {
  load-$1

  case $? in
    0)
      echo -n -e "${GREEN}•${WHITE}"
      ;;
    255) # -1
      echo -n -e "${YELLOW}•${WHITE}"
      ;;
    *)
      echo -n -e "${RED}•${1}${WHITE}"
  esac
}

load-modules() {
  for SCRIPT in $(find $MODULES_DIR -name "*.bash" -type f); do
    . $SCRIPT
    load-module $(basename $SCRIPT | sed -e s/$(basename $EXTENSIONS_DIR)//)
  done

  echo
}

load-modules
