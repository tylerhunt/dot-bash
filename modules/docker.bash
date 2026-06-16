load-docker() {
  is-executable docker || is-executable orb || return 1

  export DOCKER_DEFAULT_PLATFORM=linux/amd64

  if is-executable orb ; then
    source ~/.orbstack/shell/init.bash 2>/dev/null || :
  else
    # Bash completion
    if is-executable brew ; then
      local DOCKER_COMPLETION="$(brew --prefix)/etc/bash_completion.d/docker"

      if [ ! -f $DOCKER_COMPLETION ]; then
        echo $DOCKER_COMPLETION
        docker completion bash > $DOCKER_COMPLETION
      fi
    fi
  fi

  return 0
}
