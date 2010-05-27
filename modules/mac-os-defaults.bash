# Sets the Mac OS X dock to the no-glass style.

load-mac-os-defaults() {
  if is-mac-os; then
    use-no-glass-dock() {
      if is-mac-os; then
        local DEFAULTS=`which defaults`
        local DOMAIN='com.apple.dock'
        local KEY='no-glass'

        if [ -x $DEFAULTS ]; then
          if [ "$($DEFAULTS read $DOMAIN $KEY 2> /dev/null)" != "1" ]; then
            defaults write $DOMAIN $KEY -boolean YES
            killall Dock
          fi
        fi
      else
        return 1
      fi
    }

    use-new-list-stack() {
      defaults write com.apple.dock use-new-list-stack -bool YES
    }

    use-xray-folders() {
      defaults write com.apple.finder QLEnableXRayFolders -bool YES
    }

    fix-email-copy-paste() {
      defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool NO
    }

    disable-dot-underscore-files() {
      export COPYFILE_DISABLE=true
    }

    use-no-glass-dock
    use-new-list-stack
    use-xray-folders
    fix-email-copy-paste
    disable-dot-underscore-files
  else
    return 1
  fi
}
