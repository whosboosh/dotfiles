#!/bin/sh
# Uses xwinwrap to display given animated .gif in the center of the screen

if [ $# -ne 1 ]; then
	echo 1>&2 Usage: $0 image.gif
	exit 1
fi

#get screen resolution
SCRH=`xrandr | awk '/current/ { print $8 }'`
SCRW=`xrandr | awk '/current/ { print $10 }'`
SCRW=${SCRW%\,}

#get gif resolution
IMGHW=`gifsicle --info $1 | awk '/logical/ { print $3 }'`
IMGH=${IMGHW%x*}
IMGW=${IMGHW#*x}

#calculate position
POSH=$((($SCRH/2)-($IMGH/2)))
POSW=$((($SCRW/2)-($IMGW/2)))

#xwinwrap -g ${IMGHW}+${POSH}+${POSW} -ni -b -fs -ov -nf -- gifview -w WID --geometry 2256x1604+0+0 $1 -a --no-interactive --min-delay 15 -i
xwinwrap -g ${IMGHW}+${POSH}+${POSW} -ni -b -fs -ov -nf -- sxiv $1 -A 12 -b -Z -g 3480x2160+0+0 -e WID -s f
