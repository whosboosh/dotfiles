#!/bin/bash
xinput --set-prop "MSHW0092:00 045E:0933 Touchpad" "libinput Natural Scrolling Enabled" 1
picom --experimental-backends
redshift -P -O 3500
nitrogen --restore
light-locker
rclone --vfs-cache-mode writes mount onedrive: ~/onedrive
systemctl restart --user spotifyd
