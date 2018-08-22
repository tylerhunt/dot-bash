load-git() {
  if ! is-executable git; then return 1; fi

  # Aliases
  alias st="git status"
  alias cm="git commit"
  alias wip="git commit -m WIP"

  # Functions
  fix() {
    if [ $# -eq 0 ]; then echo "Usage: fix [ref]" && return; fi
    git rebase -i --autosquash "$1^"
  }
}
