#!/bin/bash

if [ ! -f "monitor_mode.dat" ] ; then
	# Start with internal mode if no configuration file exists
  	mode="internal"
else
	# otherwise read the value from the file
  	mode=`cat monitor_mode.dat`
fi

# Switch modes
if [ $mode = "internalexternal" ]; then
        next="internal"
elif [ $mode = "internal" ]; then
        next="internalexternal"
fi

# Save configuration
echo "${next}" > monitor_mode.dat

# Now run monitor setup separately
