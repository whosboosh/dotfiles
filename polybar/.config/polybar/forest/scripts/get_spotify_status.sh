#!/bin/bash

# The name of polybar bar which houses the main spotify module and the control modules.
PARENT_BAR="main"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

# Set the source audio player here.
# Players supporting the MPRIS spec are supported.
# Examples: spotify, vlc, chrome, mpv and others.
# Use `playerctld` to always detect the latest player.
# See more here: https://github.com/altdesktop/playerctl/#selecting-players-to-control
PLAYER="spotifyd"

# Format of the information displayed
# Eg. {{ artist }} - {{ album }} - {{ title }}
# See more attributes here: https://github.com/altdesktop/playerctl/#printing-properties-and-metadata
FORMAT="{{ title }} - {{ artist }}"

# Sends $2 as message to all polybar PIDs that are part of $1
update_hooks() {
    while IFS= read -r id
    do
        polybar-msg -p "$id" hook spotify-play-pause $2 1>/dev/null 2>&1
    done < <(echo "$1")
}

#PLAYER_STATUS="chrome"
#PLAYERCTL_STATUS=$(playerctl --player=$PLAYER_STATUS status 2>/dev/null)
#EXIT_CODE=$?

#if [ $EXIT_CODE -eq 0 ]; then
#    STATUS=$PLAYERCTL_STATUS
#else
#    STATUS="No player is running"
#fi

if [ "$1" == "--status" ]; then
    echo "Playing"
else
		LASTUPDATED=$(cat /home/nate/.config/polybar/forest/scripts/spotify/last_updated)
		if [ "$(($(date +%s)-$LASTUPDATED))" -lt 3 ] 
		then
			echo "$(cat /home/nate/.config/polybar/forest/scripts/spotify/current_song)"
		else
			SONG=$(playerctl --player=$PLAYER metadata --format "$FORMAT")
			echo $(date +%s) > "/home/nate/.config/polybar/forest/scripts/spotify/last_updated"

			CURRENTSONG=$(cat /home/nate/.config/polybar/forest/scripts/spotify/current_song)
			if [ "$SONG" != "$CURRENTSONG" ]
			then
				ARTURL=$(playerctl --player=spotifyd metadata --format "{{ mpris:artUrl }}")
				curl -o /tmp/cover.jpg $ARTURL
				notify-send --urgency=low "$SONG" -i /tmp/cover.jpg
			fi		


			echo $SONG > "/home/nate/.config/polybar/forest/scripts/spotify/current_song"
			echo $SONG
		fi				
		
		update_hooks "$PARENT_BAR_PID" 2
fi
