#!/bin/bash
xinput --set-prop "MSHW0092:00 045E:0933 Touchpad" "libinput Natural Scrolling Enabled" 1
picom --experimental-backends
nitrogen --restore
#~/.config/i3/scripts/gifwallpaper.sh ~/wallpapers/gifs/sunset2_resize.gif
nm-applet
light-locker
rclone --vfs-cache-mode writes mount onedrive: ~/onedrive
systemctl restart --user spotifyd
