#!/bin/bash

if xrandr | grep -q "DP-1 connected"; then
    polybar_config="config_dp.ini"
else
    polybar_config="config_edp.ini"
fi

# Kill existing Polybar instances
killall -q polybar

# Launch Polybar using the appropriate configuration
nohup polybar -r --config=~/.config/polybar/$polybar_config > /dev/null 2>&1 &
