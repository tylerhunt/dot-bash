#!/bin/bash

load-extensions() {
  [ -z "$PS1" ] && return

  local extensions_dir="$HOME/.bash"
  local helpers_dir="$extensions_dir/helpers"
  local modules_dir="$extensions_dir/modules"

  . $helpers_dir/colors.bash
  . $helpers_dir/conditionals.bash
  . $helpers_dir/modules.bash

  [ ! -f ~/.bash/.run-once ] && touch ~/.bash/.run-once
}

load-extensions
