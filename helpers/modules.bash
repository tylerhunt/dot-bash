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
  local script

  for script in $(find $modules_dir -name "*.bash" -type f); do
    . $script
    load-module $(basename $script | sed -e s/$(basename $extensions_dir)//)
  done

  echo
}

load-modules
