#!/bin/bash
# Output names might vary, check xrandr
INT="eDP1"

# Map touchscreen to correct screen (check name via xinput list)
xinput --map-to-output "Wacom Pen and multitouch sensor Finger" $INT
xinput --map-to-output "Wacom Pen and multitouch sensor Pen Pen (0xb1cc337a)" $INT

# Configure upper stylus button to right click
xinput --set-button-map "Wacom Pen and multitouch sensor Pen Pen (0xb1cc337a)" 1 3 2 4 5 6 7

# Reload desktop background
exec feh --bg-fill ~/.config/i3/wall/saxonswitzerland.jpg
