#!/bin/bash
# Output names might vary, check xrandr
EXT1="DP2-1"
EXT2="DP2-2"
INT="eDP1"

# Disable VGA output if enabled before
#xrandr --output "VGA1" --off

if [ ! -f "monitor_mode.dat" ] ; then
	# Start with internal mode if no configuration file exists
  	mode="internal"
else
	# otherwise read the value from the file
  	mode=`cat monitor_mode.dat`
fi

if [ $mode = "internalexternal" ]; then
        xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x334 --rotate normal
        xrandr --output $EXT1 --mode 1920x1200 --pos 1920x0 --rotate normal 
        xrandr --output $EXT2 --mode 1920x1200 --pos 3840x0 --rotate normal 
else
        #sh /home/felix/.screenlayout/Internal.sh
        xrandr --output $INT --primary --mode 1920x1080 --pos 0x334 --rotate normal
        xrandr --output $EXT1 --off
        xrandr --output $EXT2 --off
fi

# Map touchscreen to correct screen (check name via xinput list)
xinput --map-to-output "Wacom Pen and multitouch sensor Finger" eDP1

# Reload desktop background
exec feh --bg-fill /home/felix/.config/i3/wall/saxonswitzerland.jpg
