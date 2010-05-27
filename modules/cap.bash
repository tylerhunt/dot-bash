load-cap() {
  if is-executable cap; then
    ruby-cap-complete() {
      local ORIGINAL_COMP_WORDBREAKS=${COMP_WORDBREAKS}

      export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
      COMPREPLY=($(compgen -W "`cap -T 2> /dev/null| awk '{{ if ( $3 ~ /\#/ ) print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
      export COMP_WORDBREAKS=${ORIGINAL_COMP_WORDBREAKS}

      return 0
    }

    complete -o default -o nospace -F ruby-cap-complete cap
  else
    return 1
  fi
}
