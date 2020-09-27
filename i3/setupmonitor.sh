#!/bin/bash
# Output names might vary, check xrandr
#EXT="HDMI2"
#INT="LVDS1"

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
        #xrandr --output $INT --auto --output $EXT --auto --right-of $INT
	sh /home/felix/.screenlayout/Internal_HDMI4K.sh
# elif [ $mode = "dp" ]; then
else
        sh /home/felix/.screenlayout/Internal.sh
fi

# Map touchscreen to correct screen
xinput --map-to-output 16 eDP1

# Reload desktop background
exec feh --bg-fill /home/felix/.config/i3/wall/saxonswitzerland.jpg
