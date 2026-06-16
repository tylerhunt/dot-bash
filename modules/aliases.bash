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

  # cURL
  alias curl_headers="curl -s -D - -o /dev/null"

  # DNS
  if is-mac-os; then
    alias flushdns='sudo killall -HUP mDNSResponder && dscacheutil -flushcache'
  fi
  if is-executable dig; then
    alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
  fi

  # Marked
  if is-mac-os; then
    alias mp="qlmanage -p"
  fi

  # macOS
  if is-mac-os; then
    alias hide_desktop='defaults write com.apple.finder CreateDesktop false; killall Finder'
    alias show_desktop='defaults delete com.apple.finder CreateDesktop; killall Finder'
  fi

  if is-executable yt-dlp; then
    alias yt-mp3='yt-dlp -x --audio-format mp3'
  fi

  # chromedriver
  alias fix-chromedriver='xattr -d com.apple.quarantine $(which chromedriver)'
}
