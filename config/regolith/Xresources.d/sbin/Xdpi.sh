#!/bin/bash
# Change DPI based on primary display
# This script is run on startup by i3
if pidof -x "Xdpi.sh" > /dev/null; then #prevent the script from running twice
    echo "Xdpi.sh is already running"
else
    p=$(xrandr -q) #init previous 
    while true; do
        c=$(xrandr -q) #init current
        if [[ $c != $p ]]; then # check current against previous for change
            if [[ "$c" ==  *"eDP-1 connected primary"* ]]; then 
                echo "#define DPI 192" > $HOME/.config/regolith/Xresources.d/XsetDPI
                echo "updating DPI to 192"
                regolith-look refresh
            elif [[ "$c" ==  *"DP-1 connected primary"* ]]; then 
                echo "#define DPI 96" > $HOME/.config/regolith/Xresources.d/XsetDPI
                echo "updating DPI to 96"
                regolith-look refresh
            fi
        fi
        p=$c
        sleep 5
    done
fi
