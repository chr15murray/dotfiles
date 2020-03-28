#!/bin/bash

# Set Mac Settings as requires

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


