#!/bin/bash

# List of tabs (replace with your application names)
tabs=("Terminal" "Chrome" "Postman")

# Get the active window's class
active_window=$(xdotool getwindowfocus getwindowname)
active_class=$(xprop -id "$(xdotool getactivewindow)" | awk '/WM_CLASS/{print $4}' | tr -d ',"')

# Loop through tabs and highlight the active one
for tab in "${tabs[@]}"; do
    if [[ "$active_class" == *"$tab"* ]]; then
        echo "%{A1:wmctrl -a \"$tab\":} %{F#ff0000}$tab%{F-} %{A}"
    else
        echo "%{A1:wmctrl -a \"$tab\":}$tab%{A}"
    fi
done
