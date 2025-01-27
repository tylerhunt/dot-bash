load-defaults() {
  # set up command history
  export HISTIGNORE="&:ls:[bf]g:jobs:exit"
  export HISTFILESIZE=1000000000
  export HISTSIZE=1000000

  # set default editor
  export EDITOR=`which vim`

  # set display for X11 forwarding
  #export DISPLAY=":0.0"

  # default command options
  export LESS='-R'
  export LYNX_CFG='~/.lynxrc'
  export RI='-f ansi'

  # enable command history for Erlang/Elixir
  export ERL_AFLAGS="-kernel shell_history enabled"
}
