#!/bin/bash
# this app creates a file in ~/pocket with the text selelcted at the given time. 
# I use i3 config to execute it:
# bindsym $mod+Shift+p exec ~/Apps/Pcket/pcket.sh
# i then use syncthing to sync it to my other devices

# Ensure the target directory exists
POCKET_DIR="$HOME/pocket"
mkdir -p "$POCKET_DIR"

# Get the current date and time for the filename
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Use xsel to get the currently selected text
SELECTED_TEXT=$(xsel -o)

# Save the text to a file in the pocket directory
echo "$SELECTED_TEXT" > "$POCKET_DIR/$TIMESTAMP.txt"

