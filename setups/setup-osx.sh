#!/bin/bash

# Make bin home directory
#mkdir -p "$HOME/.local/bin"

# Enable tap-to-click
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
#defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
#defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Disable natural scroll
#defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=%80

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -float 1.0
defaults write NSGlobalDomain InitialKeyRepeat -int 20

# Enable keyboard repeat in UI's
defaults write -g ApplePressAndHoldEnabled -bool false

# Disable Autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

###############################################################################
# Dock                                                                        #
###############################################################################

# Remove the auto-hiding Dock delay
#defaults write com.apple.dock autohide-delay -float 0

# Automatically hide and show the Dock
#defaults write com.apple.dock autohide -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Enable text selection in QuickLook
defaults write com.apple.finder QLEnableTextSelection -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

###############################################################################
# Screen                                                                      #
###############################################################################

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 0
defaults write com.apple.screensaver askForPasswordDelay -int 0

###############################################################################
# Transmission.app                                                            #
###############################################################################

# Use `~/Downloads/Torrents` to store incomplete downloads
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Torrents"

# Trash original torrent files
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

# Hide the donate message
defaults write org.m0k.transmission WarningDonate -bool false
# Hide the legal disclaimer
defaults write org.m0k.transmission WarningLegal -bool false
