#!/bin/bash

xrandr --output eDP-1 --primary --auto --mode 1920x1080 --output DP-1 --off
notify-send "DP-1 is disconnected. Laptop display is the only screen."
