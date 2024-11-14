#!/bin/bash

if [ ! -f "~/.config/i3/monitor_mode.dat" ] ; then
	# Start with internal mode if no configuration file exists
  	mode="Int"
else
	# Otherwise read the value from the file
  	mode=`cat ~/.config/i3/monitor_mode.dat`
fi

echo "${mode}"

# Switch modes
if [ $mode = "Int/Ext" ]; then
	next="Int"
elif [ $mode = "Int" ]; then
        next="Int/Ext"
fi

# Save configuration
echo "${next}" > ~/.config/i3/monitor_mode.dat

# Now run monitor setup separately
