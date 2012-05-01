load-aliases() {
  # common parameters
  alias mv='mv -i'
  alias cp='cp -i'
  alias rm='rm -i'
  alias ls='ls -G'
  alias ll='ls -l'
  alias curl='curl -L'
  alias grep='grep --color'

  # command shortcuts
  alias tt='vi `date +%G-%m-%d`.txt'
  alias screenr='screen -d -r '

  # Subversion
  if is-executable svn; then
    alias svncut="cut -c 8-"
    alias svnadd="svn add \`svn stat | grep '^\?' | svncut\`"
    alias svncom="svn commit \`svn stat | grep -v '^\?' | svncut\`"
    alias svngrep="grep -v svn"
    alias svndiffeach="for file in \`svn stat | grep -v '^?' | svncut\`; do svn diff \$file | less ; done"
  fi

  # Git
  if is-executable git; then
    alias st="git status"
    alias cm="git commit"
  fi

  # DNS
  if is-mac-os; then
    if is-mac-os 10 5 1; then
      alias flushdns='dscacheutil -flushcache'
    else
      alias flushdns='lookupd -flushcache'
    fi
  fi
  if is-executable dig; then
    alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
  fi
}
