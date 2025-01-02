#!/bin/bash

# Set Mac Settings as desired

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do
  sudo -n true
  sleep 60
  kill -0 "$$" || exit
done 2>/dev/null &

#### System Preferences
### > General > Appearance
# Dark mode
defaults write -globalDomain AppleInterfaceStyle -string Dark

### > Dock
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock orientation -string left

## > Automatically hide and show the Dock:
defaults write com.apple.dock autohide -bool true

### >Mission Controll > Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

### SIRI - 47

### Trackpad > Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Finder
## Show the path bar
defaults write com.apple.finder ShowPathbar -bool true

## Show the status bar
defaults write com.apple.finder ShowStatusBar -bool true

## Open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

## Show external drives on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

## Show usb drives on desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# General System

## Fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 2

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Group Windows by Application
# Required to allow Mission Control to work with Aerospace
defaults write com.apple.dock expose-group-apps -bool true && killall Dock

# Disable Displays have separate Spaces
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer

# Allow Windows moves via ctrl+cmd
defaults write -g NSWindowShouldDragOnGesture -bool true
