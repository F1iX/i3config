#!/bin/bash
# Output names might vary, check xrandr
EXT1="DP2-1"
EXT2="DP2-2"
TV="DP2-3"
INT="eDP1"

# Disable VGA output if enabled before
#xrandr --output "VGA1" --off

if [ ! -f ".config/i3/monitor_mode.dat" ] ; then
	# Start with internal mode if no configuration file exists
  	mode="Int"
else
	# Otherwise read the value from the file
  	mode=`cat .config/i3/monitor_mode.dat`
fi

# Set modes (check arandr for configuration parameters)
if [ $mode = "Int/Ext" ]; then
        xrandr --output $INT --primary --mode 1920x1080 --pos 0x0 --rotate normal
        xrandr --output $EXT1 --mode 1920x1200 --pos 1920x-235 --rotate normal 
        xrandr --output $EXT2 --mode 1920x1200 --pos 3840x0 --rotate normal
        xrandr --output $TV --off	
elif [ $mode = "Int/TV" ]; then
        xrandr --output $INT --primary --mode 1920x1080 --pos 0x0 --rotate normal
        xrandr --output $EXT1 --off
        xrandr --output $EXT2 --off
        xrandr --output $TV --mode 1920x1080 --pos 1920x0 --rotate normal
else
        xrandr --output $INT --primary --mode 1920x1080 --pos 0x0 --rotate normal
        xrandr --output $EXT1 --off
        xrandr --output $EXT2 --off
        xrandr --output $TV --off	
fi

# Map touchscreen to correct screen (check name via xinput list)
xinput --map-to-output "Wacom Pen and multitouch sensor Finger" $INT

# Reload desktop background
exec feh --bg-fill .config/i3/wall/saxonswitzerland.jpg
