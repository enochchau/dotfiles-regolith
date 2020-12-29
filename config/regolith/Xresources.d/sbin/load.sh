#!/bin/bash
# wrapper for Xdpi.sh to make sure it doesn't run twice
pkill -f 'Xdpi.sh'

$HOME/.config/regolith/Xresources.d/sbin/Xdpi.sh
