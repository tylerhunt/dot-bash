#!/bin/bash

load-extensions() {
  local EXTENSIONS_DIR="$HOME/.bash"
  local HELPERS_DIR="$EXTENSIONS_DIR/helpers"
  local MODULES_DIR="$EXTENSIONS_DIR/modules"

  . $HELPERS_DIR/colors.bash
  . $HELPERS_DIR/conditionals.bash
  . $HELPERS_DIR/modules.bash
}

load-extensions
