#!/bin/bash

FOCUSED=$(xprop -root _NET_ACTIVE_WINDOW | awk -F' ' '{print $NF}')

if xprop -id ${FOCUSED} _NET_WM_STATE | grep -q _NET_WM_STATE_FULLSCREEN; then
    i3-msg "[id=${FOCUSED}] fullscreen disable"
    notify-send "DUNST_COMMAND_RESUME"
else
    i3-msg "[id=${FOCUSED}] fullscreen enable"
    notify-send "DUNST_COMMAND_PAUSE"
fi

