#!/bin/bash

# Get the current split mode of the focused container
split_mode=$(i3-msg -t get_tree | jq -r '.. | select(.focused? == true) | .layout')

# Toggle between horizontal and vertical splits
if [[ "$split_mode" == "splitv" ]]; then
    i3-msg split h
else
    i3-msg split v
fi
