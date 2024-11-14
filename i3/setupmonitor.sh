#!/bin/bash
# Output names might vary, check xrandr
EXT1="DVI-I-2-2" #DP2-1
EXT2="DVI-I-1-1" #DP2-2
TV1="HDMI2"
TV2="DP2-3"
INT="eDP1"

# Disable VGA output if enabled before
#xrandr --output "VGA1" --off

if [ ! -f "~/.config/i3/monitor_mode.dat" ] ; then
	# Start with internal mode if no configuration file exists
  	mode="Int"
else
	# Otherwise read the value from the file
  	mode=`cat ~/.config/i3/monitor_mode.dat`
fi

# Set modes (check arandr for configuration parameters)
#if [ $mode = "Int/Ext" ]; then
	#arandr
        #xrandr --output $INT --primary --mode 1920x1080 --pos 0x0 --rotate normal
        #xrandr --output $EXT1 --mode 1920x1200 --pos 1920x-235 --rotate normal 
        #xrandr --output $EXT2 --mode 1920x1200 --pos 3840x0 --rotate normal
        #xrandr --output $TV1 --off	
        #xrandr --output $TV2 --off	
#elif [ $mode = "Int/TV" ]; then
#        xrandr --output $INT --primary --mode 1920x1080 --pos 0x0 --rotate normal
#        xrandr --output $EXT1 --off
#        xrandr --output $EXT2 --off
#        xrandr --output $TV1 --mode 1920x1080 --pos 1920x0 --rotate normal
#        xrandr --output $TV2 --mode 1920x1080 --pos 1920x0 --rotate normal
#else
        xrandr --output $INT --primary --mode 1920x1080 --pos 0x0 --rotate normal
        xrandr --output $EXT1 --off
        xrandr --output $EXT2 --off
        xrandr --output $TV1 --off	
        xrandr --output DP1 --off
	xrandr --output DP2 --off	
#fi

# Map touchscreen to correct screen (check name via xinput list)
xinput --map-to-output "Wacom Pen and multitouch sensor Finger" $INT
xinput --map-to-output "Wacom Pen and multitouch sensor Pen Pen (0xb1cc337a)" $INT

# Configure upper stylus button to right click
xinput --set-button-map "Wacom Pen and multitouch sensor Pen Pen (0xb1cc337a)" 1 3 2 4 5 6 7

# Reload desktop background
exec feh --bg-fill ~/.config/i3/wall/saxonswitzerland.jpg
