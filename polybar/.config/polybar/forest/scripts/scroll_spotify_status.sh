#!/bin/bash

# see man zscroll for documentation of the following parameters
zscroll -l 30 \
        --delay 0.1 \
        --scroll-padding "  " \
        --match-command "$HOME/.config/polybar/forest/scripts/get_spotify_status.sh --status" \
        --update-check true "$HOME/.config/polybar/forest/scripts/get_spotify_status.sh" &

wait
