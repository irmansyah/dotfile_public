#!/bin/bash

polybar_config="config_edp.ini"

# Kill existing Polybar instances
killall -q polybar

# Launch Polybar using the appropriate configuration
nohup polybar -r --config=~/.config/polybar/$polybar_config > /dev/null 2>&1 &
