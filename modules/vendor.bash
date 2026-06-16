load-vendor() {
  for file in ~/.bash/vendor/* ; do
    source $file
  done

  return 0
}
