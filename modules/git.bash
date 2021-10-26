load-git() {
  is-executable git || return 1

  # Aliases
  alias st="git status"
  alias cm="git commit"
  alias wip="git commit --no-verify -m WIP"
  alias br="git for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"

  # Functions
  fix() {
    if [ $# -eq 0 ]; then echo "Usage: fix [ref]" && return; fi
    git rebase -i --autosquash "$1^"
  }
}
