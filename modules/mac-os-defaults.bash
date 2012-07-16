# Sets the Mac OS X dock to the no-glass style.

load-mac-os-defaults() {
  if is-mac-os ; then
    [ -f ~/.bash/.run-once ] && return

    # Finder
    defaults write com.apple.finder EmptyTrashSecurely -bool true
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    defaults write com.apple.finder QLEnableTextSelection -bool true
    defaults write com.apple.finder ShowStatusBar -bool true
    killall Finder

    # Dock
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock no-glass -boolean true
    defaults write com.apple.dock use-new-list-stack -bool true
    killall Dock

    # Safari
    defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
    defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
    defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

    # Miscellaneous
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
    defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true
  else
    return 1
  fi
}
