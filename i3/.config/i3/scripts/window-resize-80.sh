#!/bin/bash

# Define a temporary file to store the size
SIZE_FILE="/tmp/i3_last_size"

# Function to get the current container dimensions
get_current_size() {
  i3-msg -t get_tree | jq -r '.. | objects | select(.focused? == true) | .rect.height'
}

# Function to get the total screen height
get_total_height() {
  xrandr | grep 'current' | awk '{print $8}'
}

# Resize logic
if [ -f "$SIZE_FILE" ]; then
  # File exists, read the previous size
  last_size=$(cat "$SIZE_FILE")

  if [[ -n "$last_size" ]]; then
    # Revert to the previous size
    i3-msg resize set height "$last_size" px

    # Remove the file as we're back to the original size
    rm "$SIZE_FILE"
  else
    echo "Error: Previous size is empty."
  fi
else
  # No previous size stored; save the current size
  current_size=$(get_current_size)

  if [[ -z "$current_size" ]]; then
    echo "Error: Could not retrieve current container size."
    exit 1
  fi

  echo "$current_size" > "$SIZE_FILE"

  # Get the total screen height
  total_height=$(get_total_height)
  echo "Debug: Total height is '$total_height'"

  if [[ -z "$total_height" ]]; then
    echo "Error: Could not retrieve total screen height."
    exit 1
  fi

  # Validate that total_height is numeric
  if ! [[ "$total_height" =~ ^[0-9]+$ ]]; then
    echo "Error: Total height is not numeric ('$total_height')."
    exit 1
  fi

  # Calculate 80% height using bc for floating-point arithmetic
  target_height=$(echo "$total_height * 0.8" | bc | cut -d'.' -f1)

  if [[ -z "$target_height" ]]; then
    echo "Error: Target height calculation failed."
    exit 1
  fi

  echo "Debug: Target height is '$target_height'"

  # Resize to 80%
  i3-msg resize set height "$target_height" px
fi



# #!/bin/bash

# # Calculate 80% height
# total_height=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d'x' -f2)
# target_height=$((total_height * 80 / 100))

# # Resize the focused container
# i3-msg resize set height $target_height px
