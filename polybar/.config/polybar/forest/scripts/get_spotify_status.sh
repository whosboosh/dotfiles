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

			LASTUPDATED=$(cat /home/nate/.config/polybar/forest/scripts/spotify/last_updated)

			if [ "$1" == "--status" ]; then
    		echo "Playing"
			fi
		
			if [ "$(($(date +%s) - $LASTUPDATED))" -lt 3 ]
			then
				echo "$(cat /home/nate/.config/polybar/forest/scripts/spotify/current_song)" # Might need to make this absolute
			else
				COMMAND=$(playerctl --player=$PLAYER status)
				if [[ $COMMAND == "No player could handle this command" || $COMMAND == "Stopped" ]]
				then
					#SONG="No song playing"
					SONG="$(cat /home/nate/.config/polybar/forest/scripts/spotify/current_song)"
				elif [[ $COMMAND == "Paused" ]]
				then
					SONG=$COMMAND
				else
					# Fetch new track from playerctl
					SONG=$(playerctl --player=$PLAYER metadata --format "$FORMAT")
					CURRENTSONG=$(cat /home/nate/.config/polybar/forest/scripts/spotify/current_song)
					echo $(date +%s) > "/home/nate/.config/polybar/forest/scripts/spotify/last_updated"

					# Check if cache is different to fetched song
					if [ "$SONG" != "$CURRENTSONG" ]
					then
						ARTURL=$(playerctl --player=$PLAYER metadata --format "{{ mpris:artUrl }}")
						curl -o /tmp/cover.jpg $ARTURL
						notify-send -t 2000 "$SONG" -i /tmp/cover.jpg

						echo $SONG > "/home/nate/.config/polybar/forest/scripts/spotify/current_song"
					fi
				fi
			fi
		
	
			
			# Output the current playing song
			echo $SONG
			
		update_hooks "$PARENT_BAR_PID" 2
