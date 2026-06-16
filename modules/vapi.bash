function load-vapi() {
  export VAPI_INSTALL="$HOME/.vapi"
  export PATH="$VAPI_INSTALL/bin:$PATH"
  export MANPATH=""$HOME/.vapi"/share/man:$MANPATH"
}
