#!/bin/bash

# Set lock screen background
LOCK_IMAGE=~/.config/Wallpapers/lockscreen_combined.png

# Check if i3lock is installed
if ! command -v i3lock &>/dev/null; then
    echo "i3lock not installed. Install it and try again."
    exit 1
fi

# Use i3lock with the combined image
# i3lock -i "$LOCK_IMAGE"

i3lock \
  --image="$LOCK_IMAGE" \
  --blur 5 \
  --indicator \
  --clock \
  --time-pos="x+110:h-70" \
  --date-pos="tx:ty+15" \
  --inside-color=6A8C7FFF \
  --ring-color=D3C6AAff \
  --line-color=00000000 \
  --keyhl-color=db5757ff \
  --bshl-color=db5757ff \
  --separator-color=00000000 \
  --inside-wrong-color=db5757ff \
  --ring-wrong-color=db5757ff \
  --verif-text="Verifying..." \
  --verif-text-color=00ff00ff \
  --wrong-text="Wrong!" \
  --noinput-text="No Input" \
  --lock-text="Locking..." \
  --time-color=D3C6AAff \
  --date-color=D3C6AAff \
  --layout-color=D3C6AAff \
  --greeter-text="Enter your password" \
  --greeter-color=D3C6AAff \
  --greeter-pos="x+110:h-100"
