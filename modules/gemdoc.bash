# http://stephencelis.com/archive/2008/6/bashfully-yours-gem-shortcuts

load-gemdoc() {
  if is-executable gem; then
    gemdoc() {
      local GEMDIR=`gem env gemdir`
      open $GEMDIR/doc/`$(which ls) $GEMDIR/doc | grep $1 | sort | tail -1`/rdoc/index.html
    }

    gemdoc_complete() {
      local GEMDIR=`gem env gemdir`
      COMPREPLY=($(compgen -W "$(`which ls` $GEMDIR/doc)" -- ${COMP_WORDS[COMP_CWORD]}))
      return 0
    }

    complete -o default -o nospace -F gemdoc_complete gemdoc
  else
    return 1
  fi
}
