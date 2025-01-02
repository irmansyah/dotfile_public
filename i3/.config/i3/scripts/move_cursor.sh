# #!/bin/bash

# # Get the window ID of the currently focused window
# window_id=$(xdotool getwindowfocus)

# # Get the window geometry
# geometry=$(xdotool getwindowgeometry "$window_id")

# # Extract the window dimensions and position
# x=$(echo "$geometry" | grep "Position:" | awk '{print $2}' | cut -d'x' -f1)
# y=$(echo "$geometry" | grep "Position:" | awk '{print $2}' | cut -d'x' -f2)
# width=$(echo "$geometry" | grep "Geometry:" | awk '{print $2}' | cut -d'x' -f1)
# height=$(echo "$geometry" | grep "Geometry:" | awk '{print $2}' | cut -d'x' -f2)

# # Calculate the center of the window
# center_x=$((x + width / 2))
# center_y=$((y + height / 2))

# # Move the cursor to the center of the window
# xdotool mousemove $center_x $center_y

#!/bin/bash

sleep 0.3  # Add a small delay

# Get the window ID of the currently focused window
window_id=$(xdotool getwindowfocus)

# Get the window geometry
geometry=$(xdotool getwindowgeometry "$window_id")

# Extract the window dimensions and position
x=$(echo "$geometry" | grep "Position:" | awk '{print $2}' | cut -d'x' -f1)
y=$(echo "$geometry" | grep "Position:" | awk '{print $2}' | cut -d'x' -f2)
width=$(echo "$geometry" | grep "Geometry:" | awk '{print $2}' | cut -d'x' -f1)
height=$(echo "$geometry" | grep "Geometry:" | awk '{print $2}' | cut -d'x' -f2)

# Calculate the center of the window
center_x=$((x + width / 2))
center_y=$((y + height / 2))

# Move the cursor to the center of the window
xdotool mousemove $center_x $center_y
