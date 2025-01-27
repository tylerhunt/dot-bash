load-mac-os-defaults() {
  is-mac-os || return 1

  export BASH_SILENCE_DEPRECATION_WARNING=1

  [ -f ~/.bash/.run-once ] && return

  # Finder
  #defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
  #defaults write com.apple.finder QLEnableTextSelection -bool true
  defaults write com.apple.finder ShowStatusBar -bool true
  #defaults write com.apple.finder CreateDesktop -bool false
  defaults write com.apple.finder _FXSortFoldersFirst -bool true
  killall Finder

  # Dock
  defaults write com.apple.dock autohide -bool true
  #defaults write com.apple.dock no-glass -boolean true
  #defaults write com.apple.dock use-new-list-stack -bool true
  killall Dock

  # Safari
  #defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
  #defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
  #defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

  # Messages
  #defaults write com.apple.iChat SaveConversationsOnClose -bool true
  #defaults write com.apple.iChat NSUserKeyEquivalents -dict-add 'Close Window' '@w'
  #defaults write com.apple.iChat NSUserKeyEquivalents -dict-add 'Close Conversation' '@$w'
  #defaults write com.apple.iChat NSUserKeyEquivalents -dict-add 'Delete Conversation...' '~$\b'

  # Miscellaneous
  #defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
  #defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
  #defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

  # Kernel
  #sudo sysctl -w kern.sysv.shmall=65536
  #sudo sysctl -w kern.sysv.shmmax=16777216
}
