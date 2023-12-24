#!/bin/bash

# Specify the target directory
output_directory="$HOME/pocket"

# Create the directory if it doesn't exist
mkdir -p "$output_directory"

# Activate the Firefox window (you may need to adjust the window title)
firefox_window_id=$(xdotool search --name "Mozilla Firefox" windowactivate)
sleep 1

# Simulate key presses to open the print dialog (you may need to adjust the shortcut)
xdotool key --clearmodifiers --window "$firefox_window_id" Ctrl+p
sleep 2

# Simulate key press to confirm and print (you may need to adjust the shortcut)
xdotool key --clearmodifiers --window "$firefox_window_id" Return
sleep 5


xdotool key --clearmodifiers --window "$firefox_window_id" Return
sleep 5


# Move the last PDF file from the home directory to ~/pocket with a timestamp
last_pdf=$(ls -t ~/*.pdf 2>/dev/null | head -n1)
if [ -n "$last_pdf" ]; then
    timestamp=$(date "+%Y%m%d_%H%M%S")
    filename=$(basename "$last_pdf")
    new_filename="$timestamp-${filename// /_}"  # Replace spaces with underscores
    mv "$last_pdf" "$output_directory/$new_filename" >> ~/script_output.log 2>&1
    echo "Moved $last_pdf to $output_directory/$new_filename"
else
    echo "No PDF files found in the home directory."
fi

