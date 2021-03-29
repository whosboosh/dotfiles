#!/bin/bash

# Loop through watch directory
for filename in /path/to/watch/directory/*.magnet; do
  # Assign the contents of the magnet file to a variable
  magnet="`cat "$filename"`"
  # Check if magnet file contains hash
  [[ "$magnet" =~ xt=urn:btih:([^&/]+) ]] || exit;
  # cd to watch directory
  cd /path/to/watch/directory/
  # Create torrent file with data in expected format
  echo "d10:magnet-uri${#magnet}:${magnet}e" > "meta-${BASH_REMATCH[1]}.torrent"
  # Delete the magnet file
  rm "$filename"
done
