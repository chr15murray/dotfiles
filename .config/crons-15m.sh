#!/bin/bash

# Check For Outstanding Yadm Changes
/usr/local/bin/yadm diff --quiet || /usr/local/bin/terminal-notifier -title YADM -subtitle "yadm diff detected" -message "Ensure you commit your changes" -appIcon ~/.config/monkey-icon.png

# Sync Tasks
/usr/local/bin/task sync
