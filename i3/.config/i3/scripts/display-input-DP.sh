#!/bin/bash

# Check if DP-1 is connected
if xrandr | grep -q "DP-1 connected"; then
    # If DP-1 is connected, make it the main screen and turn off the laptop display (eDP-1)
    xrandr --output DP-1 --primary --auto --mode 2560x1440 --output eDP-1 --off
    notify-send "DP-1 is connected. It's now the main screen. Laptop display turned off."

else
    # If DP-1 is disconnected, use only the laptop display (eDP-1)
    xrandr --output eDP-1 --primary --auto --mode 1920x1080 --output DP-1 --off
    notify-send "DP-1 is disconnected. Laptop display is the only screen."
fi
