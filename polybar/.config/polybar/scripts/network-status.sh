#!/bin/sh

INTERFACE="wlan0"

case "$1" in
    --popup)
        # Fetch network details
        SSID=$(nmcli -t -f GENERAL.CONNECTION device show $INTERFACE | cut -d':' -f2 | xargs)
        IP=$(nmcli -t -f IP4.ADDRESS device show $INTERFACE | cut -d':' -f2 | xargs | cut -d'/' -f1)
        SPEED=$(nmcli -t -f WIFI.BITRATE device show $INTERFACE | cut -d':' -f2 | xargs)
        RX_BYTES=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
        TX_BYTES=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
        SLEEP_INTERVAL=1

        # Calculate data transfer rates
        sleep $SLEEP_INTERVAL
        NEW_RX_BYTES=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
        NEW_TX_BYTES=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

        RX_RATE=$(( (NEW_RX_BYTES - RX_BYTES) / SLEEP_INTERVAL ))
        TX_RATE=$(( (NEW_TX_BYTES - TX_BYTES) / SLEEP_INTERVAL ))

        # Convert rates to human-readable format
        RX_HR=$(numfmt --to=iec $RX_RATE)
        TX_HR=$(numfmt --to=iec $TX_RATE)

        # Show detailed info in a notification
        notify-send "Network Status" "SSID: ${SSID:-Unknown}
IP: ${IP:-Unavailable}
Speed: ${SPEED:-Unknown}
Download: $RX_HR/s
Upload: $TX_HR/s"
        ;;
    *)
        # Display basic info for Polybar
        SSID=$(nmcli -t -f GENERAL.CONNECTION device show $INTERFACE | cut -d':' -f2 | xargs)
        echo "${SSID:-Disconnected}"
        ;;
esac

