#!/bin/bash

# Get the current layout
layout=$(i3-msg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.focused==true).layout')

echo $layout
# Toggle between stacking and splitting layouts
if [ "$layout" == "splith" ]; then
    i3-msg layout stacked
else 
    i3-msg layout splitv
fi
