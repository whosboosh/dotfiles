#!/bin/bash

xrandr --output eDP1 --auto --output HDMI1 --auto --left-of eDP1
xinput --set-prop "MSHW0092:00 045E:0933 Touchpad" "libinput Natural Scrolling Enabled" 1
picom --experimental-backends -b
redshift -P -O 3000
nitrogen --restore
light-locker
~/.config/polybar/launch.sh
rclone --vfs-cache-mode writes mount onedrive: ~/onedrive
