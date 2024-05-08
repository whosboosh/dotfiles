#!/bin/bash

FOCUSED=$(xprop -root _NET_ACTIVE_WINDOW | awk -F' ' '{print $NF}')

if xprop -id ${FOCUSED} _NET_WM_STATE | grep -q _NET_WM_STATE_FULLSCREEN; then
    i3-msg "[id=${FOCUSED}] fullscreen disable"
		dunstctl set-paused false
else
    i3-msg "[id=${FOCUSED}] fullscreen enable"
		dunstctl set-paused true
fi

