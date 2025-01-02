#!/bin/sh

YAD_WIDTH=400
YAD_HEIGHT=200
BOTTOM=false
DATE=""

case "$1" in
    --popup)
        eval "$(xdotool getmouselocation --shell)"
        # Correct for DPI scaling
        #X=$(X * GDK_DPI_SCALE)
        Y=$(Y * GDK_DPI_SCALE)

        if [ $BOTTOM = true ]; then
            : $(( pos_y = Y - YAD_HEIGHT - 20 ))
	    : $(( pos_x = (X) - (YAD_WIDTH / 2)))
        else
	    : $(( pos_y = Y + 14 ))
	    : $(( pos_x = (X) - (YAD_WIDTH / 2)))
        fi

        yad --calendar --undecorated --fixed --close-on-unfocus --no-buttons \
            --width=$YAD_WIDTH --height=$YAD_HEIGHT --posx=$pos_x --posy=$pos_y \
            > /dev/null
        ;;
    *)
        echo "$DATE"
        ;;
esac
