# Sets the prompt format. If git is present, shows the branch and dirty status
# (http://henrik.nyh.se/2008/12/git-dirty-prompt, http://gist.github.com/31675,
# http://gist.github.com/31867, http://gist.github.com/31934).

load-prompt() {
  if is-executable git; then
    parse-git-branch() {
      local GIT_STATUS="$(git status 2> /dev/null)"
      local REMOTE_PATTERN="# Your branch is (.*) of '.+' by ([0-9]+) commit"
      local DIVERGE_PATTERN="# Your branch and (.*) have diverged"
      local BRANCH_PATTERN="^# On branch ([^${IFS}]*)"

      if [[ ! ${GIT_STATUS}} =~ "working directory clean" ]]; then
        local STATE="⚡"
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
    local USER="${PS_CYAN_BOLD}\u"
    local HOST="${PS_WHITE}@${PS_GREEN_BOLD}\h"
    local CWD="${PS_WHITE}:${PS_YELLOW_BOLD}\W"
    local END="${PS_WHITE}> "

    export PS1="${USER}${HOST}${CWD}$(parse-git-branch)${END}"
  }

  export PROMPT_COMMAND=prompt-function

  clear-prompt() {
    export PROMPT_COMMAND=
    export PS1="${PS_WHITE_BOLD}\$>${PS_WHITE} "
 }
}
