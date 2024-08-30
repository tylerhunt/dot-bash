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
}
