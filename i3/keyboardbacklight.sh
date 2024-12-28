#!/bin/bash
# Changes the keyboard backlight brightness
# Note that for many Lenovo ThinkPad devices this functionality is already implemented anc accessible e.g. using Fn + space

max_brightness=$(cat /sys/class/leds/tpacpi::kbd_backlight/max_brightness)
old_brightness=$(cat /sys/class/leds/tpacpi::kbd_backlight/brightness)
new_brightness=$(($old_brightness + 1))
if [ "$old_brightness" -eq "$max_brightness" ]; then
    new_brightness="0"
fi

dbus-send --system --type=method_call  --dest="org.freedesktop.UPower" "/org/freedesktop/UPower/KbdBacklight" "org.freedesktop.UPower.KbdBacklight.SetBrightness" int32:$new_brightness
