# Sets up vi-style keybindings for the shell and line editing libraries.

load-vi-key-bindings() {
  [ -f ~/.bash/.run-once ] && return

  if [ ! -e ~/.editrc ]; then
    # Enables vi key bindings for the Editline library.
    cp ~/.bash/files/vi-key-bindings/.editrc ~/
  fi

  if [ ! -e ~/.inputrc ]; then
    # Enables vi key bindings for the Readline library.
    cp ~/.bash/files/vi-key-bindings/.inputrc ~/
  fi
}
