#!/bin/bash

xrandr --output DP-1 --mode 2560x1440 --pos 0x0 --primary --output eDP-1 --mode 1920x1080 --pos 2560x0
notify-send "DP-1 is disconnected. Laptop display is the only screen."
