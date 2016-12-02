title=`exaile --get-title`
artist=`exaile --get-artist`
album=`exaile --get-album`
position=`exaile --current-position`
progress=`exaile --current-progress`
#length=`exaile --get-length`
#all=`exaile -q`
if [ -n "$title" ]; then
	all="$title -- "
	none=false
fi
if [ -n "$artist" ]; then
	all=$all"$artist -- "
fi
if [ -n "$album" ]; then
	all=$all"$album -- "
fi
if [ -n "$position" ]; then
#if [ -n "$length" ]; then
#all=$all"$progress%($position) of [$length]"
	all=$all"$progress%($position)"
fi
notify-send -t 4000 "$all"
