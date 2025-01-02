#!/bin/bash

#nohup alacritty --class WORK_SSH -e cd ~/works/_startup/bukuku/ > /dev/null 2>&1 &
#nohup alacritty --class WORK_SSH -command cd ~/works/_startup/bukuku/ > /dev/null 2>&1 &

nohup sh -c 'cd ~/works/_startup/bukuku/ && ghostty --class WORK_SSH' > /dev/null 2>&1 &
