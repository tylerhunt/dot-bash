load-aliases() {
  # common parameters
  alias mv='mv -i'
  alias cp='cp -i'
  alias rm='rm -i'
  alias ls='ls -G'
  alias ll='ls -l'
  alias curl='curl -L'
  alias grep='grep --color'
  alias tar='COPYFILE_DISABLE=true tar'
  alias ack='ack -a'
  alias less='less -r'

  # Git
  if is-executable git; then
    alias st="git status"
    alias cm="git commit"
  fi

  # DNS
  if is-mac-os; then
    alias flushdns='sudo dscacheutil -flushcache'
  fi
  if is-executable dig; then
    alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
  fi

  # Marked
  if is-mac-os; then
    alias mp="open -a Marked"
  fi

  # OS X
  alias hide_desktop='defaults write com.apple.finder CreateDesktop false; killall Finder'
  alias show_desktop='defaults delete com.apple.finder CreateDesktop; killall Finder'
}
