#!/bin/bash
# Output names might vary, check xrandr
EXT="VGA1"
INT="LVDS1"


xrandr --output $INT --auto --output $EXT --auto --right-of $INT

exec feh --bg-fill /home/felix/.wall/mallorca.jpg
