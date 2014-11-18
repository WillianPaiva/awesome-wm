#!/bin/bash

xrandr | grep DP- | grep " connected ";
if [ $? -eq 0 ]; then
   echo "other screens connected" 
else
	pm-suspend
fi
