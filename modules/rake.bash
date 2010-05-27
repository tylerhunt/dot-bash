load-rake() {
  if is-executable rake; then
    ruby-rake-complete() {
      local ORIGINAL_COMP_WORDBREAKS=${COMP_WORDBREAKS}

      export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
      COMPREPLY=($(compgen -W "`rake -s -T 2> /dev/null | awk '{{print $2}}'`" -- ${COMP_WORDS[COMP_CWORD]}))
      export COMP_WORDBREAKS=${ORIGINAL_COMP_WORDBREAKS}

      local cur="${COMPREPLY}"

      case "$cur" in
        *:*)
          case "$COMP_WORDBREAKS" in
            *:*) colon_prefix=$(echo $cur | sed 's/:[^:]*$/:/' )
              COMPREPLY=${COMPREPLY##${colon_prefix}}
              ;;
          esac
          ;;
      esac

      return 0
    }

    complete -o default -o nospace -F ruby-rake-complete rake
  else
    return 1
  fi
}
