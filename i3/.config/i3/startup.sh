xrandr --auto

nitrogen --restore
picom -b & 
xinput --set-prop "MSHW0092:00 045E:0933 Touchpad" "libinput Natural Scrolling Enabled" 1 &
~/.config/polybar/launch.sh &
redshift -P -O 3000 &
