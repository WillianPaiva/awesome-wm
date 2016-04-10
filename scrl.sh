#!/bin/bash

xrandr | grep DP- | grep " connected ";
if [ $? -eq 0 ]; then
    # External monitor is connected
	xrandr --output DP-2 --mode 1920x1080 --pos 0x0 --output DP-0 --mode 1920x1080 --pos 1920x0 --output LVDS-0 --off --primary DP-0
    xrandr --output DP-0 --primary
    if [ $? -ne 0 ]; then
		echo "wrong"
        # Something went wrong. Autoconfigure the internal monitor and disable the external one
        xrandr --output LVDS-0 --mode auto --output DP-0 --off --output DP-2 --off 
        xrandr --output LVDS-0 --primary
    fi
else
	echo $?
    # External monitor is not connected
    xrandr --output LVDS-0 --mode 1920x1080 --output DP-0 --off --output DP-2 --off --pri
    xrandr --output LVDS-0 --primary
fi
