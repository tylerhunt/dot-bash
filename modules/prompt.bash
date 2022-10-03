# Sets the prompt format. If git is present, shows the branch and dirty status
# (http://henrik.nyh.se/2008/12/git-dirty-prompt, http://gist.github.com/31675,
# http://gist.github.com/31867, http://gist.github.com/31934).

load-prompt() {
  if is-executable git; then
    parse-git-branch() {
      local GIT_STATUS="$(git status 2> /dev/null)"
      local REMOTE_PATTERN="# Your branch is (.*) of '.+' by ([0-9]+) commit"
      local DIVERGE_PATTERN="# Your branch and (.*) have diverged"
      local BRANCH_PATTERN="On branch ([^${IFS}]*)"

      if [[ ! ${GIT_STATUS} =~ "working directory clean" ]]; then
        local STATE="⟠"
      fi

      if [[ ${GIT_STATUS} =~ ${REMOTE_PATTERN} ]]; then
        local COMMITS=${BASH_REMATCH[2]}

        if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
          local REMOTE="↑${COMMITS}"
        else
          local REMOTE="↓${COMMITS}"
        fi
      fi

      if [[ ${GIT_STATUS} =~ ${DIVERGE_PATTERN} ]]; then
        local REMOTE="↕"
      fi

      if [[ ${GIT_STATUS} =~ ${BRANCH_PATTERN} ]]; then
        local BRANCH=${BASH_REMATCH[1]}
        echo "${PS_WHITE}(${PS_RED}${BRANCH}${PS_YELLOW}${STATE}${PS_CYAN}${REMOTE}${PS_WHITE})"
      fi
    }
  fi

  prompt-function() {
    local TITLE="\[\e]0;\u@\h:\w\007\]"
    local USER="${PS_CYAN}\u"
    local HOST="${PS_WHITE}@${PS_GREEN}\h"
    local CWD="${PS_WHITE}:${PS_YELLOW}\W"
    local END="${PS_WHITE}> ${PS_WHITE}"

    if [ -n "$(type -t parse-git-branch)" ]; then
      export PS1="${TITLE}${USER}${HOST}${CWD}$(parse-git-branch)${END}"
    else
      export PS1="${TITLE}${USER}${HOST}${CWD}${END}"
    fi
  }

  export PROMPT_COMMAND="prompt-function;$PROMPT_COMMAND"

  clear-prompt() {
    unset -v PROMPT_COMMAND
    export PS1="$> "
 }
}
