load-ruby() {
  # Aliases
  alias frspec="rspec --only-failures"
  alias ffrspec="rspec --next-failure"
  alias grspec="git diff --name-only spec | xargs rspec"
  alias agrb="ag -G '\.rb$'"

  # Functions
  agrspec() {
    if [ $# -eq 0 ]; then echo "Usage: agrspec [term]" && return; fi
    rspec -fd `ag -l -G '_spec.rb$' $1 spec`
  }
  branch_down() {
    local branch=${1:-main}

    for version in `git diff --name-only --diff-filter=A ${branch}.. db/migrate/ | sed -r -n 's/^.*\/([^_]+).*$/\1/p' | tac` ; do
      VERSION=$version rails db:migrate:down
    done
  }
}
