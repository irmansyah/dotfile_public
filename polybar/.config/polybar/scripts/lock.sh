#!/bin/sh

#i3lock -e -t  -i ~/.config/Wallpapers/small.png

#Must be at /bin/i3exit

wallpaper="~/.config/Wallpapers/rusty_steel_1080.jpg"
i3lock -i "$wallpaper"

# i3lock -c 282828

# lock() {
# }

# case "$1" in
#     lock)
#         lock
#         ;;
#     logout)
#         i3-msg exit
#         ;;
#     suspend)
#         lock && systemctl suspend
#         ;;
#     hibernate)
#         lock && systemctl hibernate
#         ;;
#     reboot)
#         systemctl reboot
#         ;;
#     shutdown)
#         systemctl poweroff
#         ;;
#     *)
#         echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
#         exit 2
# esac

# exit 0
