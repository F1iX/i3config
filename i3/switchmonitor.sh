#!/bin/bash

if [ ! -f ".config/i3/monitor_mode.dat" ] ; then
	# Start with internal mode if no configuration file exists
  	mode="int"
else
	# Otherwise read the value from the file
  	mode=`cat .config/i3/monitor_mode.dat`
fi

# Switch modes
if [ $mode = "Int/Ext" ]; then
        next="Int/TV"
elif [ $mode = "Int/TV" ]; then
	next="Int"
elif [ $mode = "Int" ]; then
        next="Int/Ext"
fi

# Save configuration
echo "${next}" > .config/i3/monitor_mode.dat

# Now run monitor setup separately
