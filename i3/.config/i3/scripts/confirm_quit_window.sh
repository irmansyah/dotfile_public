#!/bin/bash
# Get the title of the currently focused window
window_title=$(xdotool getactivewindow getwindowname)

# Prompt the user with dmenu for confirmation
choice=$(echo -e "No\nYes" | dmenu -i -p "Quit $window_title?")

# If the user selects "Yes", close the window
if [ "$choice" == "Yes" ]; then
    i3-msg kill
fi
