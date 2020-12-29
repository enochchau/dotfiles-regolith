#!/bin/bash
# Change DPI based on primary display

change_dpi () {
    if [[ "$1" ==  *"eDP-1 connected primary"* ]]; then 
        echo "#define DPI 192" > $HOME/.config/regolith/Xresources.d/XsetDPI
        echo "updating DPI to 192"
        regolith-look refresh
    elif [[ "$1" ==  *"DP-1 connected primary"* ]]; then 
        echo "#define DPI 96" > $HOME/.config/regolith/Xresources.d/XsetDPI
        echo "updating DPI to 96"
        regolith-look refresh
    fi
}

echo "starting Xdpi.sh"
# init
previous=$(xrandr -q) # previous
change_dpi "$previous" #check once at startup

while true; do
    current=$(xrandr -q) #init current
    if [[ $current != $previous ]]; then # check current against previous for change
        echo "change detected"
        change_dpi "$current"
    fi
    previous=$current
    sleep 5
done
