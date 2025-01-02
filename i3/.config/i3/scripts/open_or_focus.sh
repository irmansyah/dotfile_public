#!/bin/bash

# App name passed as argument (e.g., "firefox")
app_name=$1

# hide_floating_windows() {
#     # Get IDs of all floating windows
#     floating_windows=$(i3-msg -t get_tree | jq -r '.. | select(.nodes?[]?.floating and .nodes?[]?.window_properties?.class != "scratchpad") | .nodes?[]?.window_properties?.class')
#     # floating_windows=$(i3-msg -t get_tree | jq -r '.. | select(.nodes?[]?.floating and .nodes?[]?.window_properties?.instance != "scratchpad") | .nodes?[]?.window_properties?.instance')

#     # Hide each floating window in the scratchpad
#     while IFS= read -r window_class; do
#         i3-msg "[class=\"$window_class\"] move scratchpad"
# 	      # i3-msg "[class=\"$window_class\"] scratchpad show"
#         echo "$window_class move."

#     done <<< "$floating_windows"
# }

# hide_floating_windows



i3-msg "[class=Postman] move scratchpad"

# Check if the app is running
if pgrep -x "$app_name" > /dev/null; then

    # Check if there is a floating hidden window in the scratchpad and show it
    i3-msg "[class=\"$app_name\" floating hidden] scratchpad show"
    
    # Focus the window (whether floating, tiled, or in the scratchpad)
    i3-msg "[class=\"$app_name\"] focus"
else
    # Launch the app if not running
    i3-msg exec "$app_name"
fi
