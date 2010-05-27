# Disables the creation of ._ files (http://www.litfuel.net/plush/?postid=147).

load-dot-underscore() {
  if is-mac-os; then
    export COPYFILE_DISABLE=true
  else
    return 1
  fi
}
