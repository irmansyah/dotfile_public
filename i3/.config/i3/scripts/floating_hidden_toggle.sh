#!/bin/bash

exclude_classes=("WORK_DOC" "WORK_PASS" "Pavucontrol")

# Get the list of floating windows excluding scratchpad windows
floating_windows=$(i3-msg -t get_tree | jq -r '.. | select(.nodes?[]?.floating and .nodes?[]?.window_properties?.class != "scratchpad") | .nodes?[]?.window_properties?.class')

# Loop through the floating windows and show those that don't match the excluded class names
while IFS= read -r window_class; do
    if [[ ! " ${exclude_classes[@]} " =~ " $window_class " ]]; then
	i3-msg "[class=\"$window_class\"] scratchpad show"
	echo "$window_class show."
    fi

done <<< "$floating_windows"




# #!/bin/bash

# # Path to a directory for per-window lock files
# LOCK_DIR="/tmp/i3_window_locks"
# mkdir -p "$LOCK_DIR"

# # Cooldown period in seconds
# COOLDOWN=1

# # Excluded window classes
# exclude_classes=("WORK_DOC" "WORK_PASS" "Pavucontrol")

# # Get the list of floating windows excluding scratchpad windows
# floating_windows=$(i3-msg -t get_tree | jq -r '.. | select(.nodes?[]?.floating and .nodes?[]?.window_properties?.class != "scratchpad") | .nodes?[]?.window_properties?.class')

# # Loop through the floating windows
# while IFS= read -r window_class; do
#     # Skip excluded classes
#     if [[ " ${exclude_classes[@]} " =~ " $window_class " ]]; then
#         continue
#     fi

#     # Path to the lock file for this window class
#     LOCKFILE="$LOCK_DIR/$window_class.lock"

#     # Check if the lock file exists and is recent
#     if [ -e "$LOCKFILE" ]; then
#         echo "$window_class is still in cooldown."
#         continue
#     fi

#     # Check if the window is currently visible (toggled state)
#     window_state=$(i3-msg -t get_tree | jq -r ".. | select(.window_properties?.class == \"$window_class\") | .scratchpad_state")

#     if [[ "$window_state" == "none" ]]; then
#         # Window is visible, hide it
#         i3-msg "[class=\"$window_class\"] scratchpad show"
#         echo "$window_class hidden."
#     else
#         # Window is hidden, show it
#         i3-msg "[class=\"$window_class\"] scratchpad show"
#         echo "$window_class shown."
#     fi

#     # Create the lock file for this window and set cooldown
#     touch "$LOCKFILE"
#     (sleep "$COOLDOWN" && rm -f "$LOCKFILE") & disown
# done <<< "$floating_windows"
