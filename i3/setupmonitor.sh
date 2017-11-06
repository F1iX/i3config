#!/bin/bash
# Output names might vary, check xrandr
EXT="VGA-1"
INT="LVDS-1"


if [ ! -f "monitor_mode.dat" ] ; then
	# Start with internal mode if no configuration file exists
  	mode="internal"
else
	# otherwise read the value from the file
  	mode=`cat monitor_mode.dat`
fi

if [ $mode = "internalexternal" ]; then
        xrandr --output $INT --auto --output $EXT --auto --right-of $INT
# elif [ $mode = "dp" ]; then
else
        xrandr --output $EXT --off --output $INT --auto
fi
