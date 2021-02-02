:x#!/bin/bash

xrandr --output eDP1 --auto --output DP2-2 --auto --left-of eDP1 --output DP2-1 --auto --right-of eDP1
xinput --set-prop "MSHW0092:00 045E:0933 Touchpad" "libinput Natural Scrolling Enabled" 1
picom --experimental-backends &
redshift -P -O 3000
nitrogen --restore
light-locker
~/.config/polybar/forest/launch.sh &
rclone --vfs-cache-mode writes mount onedrive: ~/onedrive
systemctl restart --user spotifyd
