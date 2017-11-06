#!/bin/bash
# Changes screen brightness by writing a value to the ACPI handler in /sys/class/backlight.
# Make sure the file brightness is writable by adding the following to /etc/udev/rules.d/backlight.rules
# 
# ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="acpi_video0", RUN+="/bin/chgrp video /sys/class/backlight/%k/brightness"
# ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="acpi_video0", RUN+="/bin/chmod g+w /sys/class/backlight/%k/brightness"

# base dir for backlight class
basedir="/sys/class/backlight/"

# get the backlight handler
handler=$basedir$(ls $basedir)"/"

# get current brightness
old_brightness=$(cat $handler"brightness")

# get max brightness
max_brightness=$(cat $handler"max_brightness")

# get current brightness %
old_brightness_p=$(( 100 * $old_brightness / $max_brightness ))

# calculate new brightness % 
new_brightness_p=$(($old_brightness_p $1))

# saturate brightness % [1...100]
if [ "$new_brightness_p" -lt "1" ]; then
	new_brightness_p="1"
elif [ "$new_brightness_p" -gt "100" ]; then
	new_brightness_p="100"
fi

# calculate new brightness value
new_brightness=$(( $max_brightness * $new_brightness_p / 100 ))
echo $new_brightness

# set the new brightness value
#sudo chmod 666 $handler"brightness"
echo $new_brightness > $handler"brightness"
