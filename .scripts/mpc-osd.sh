title=`mpc -f [%title%] current`
name=`mpc -f [%name%] current`
artist=`mpc -f [%artist%] current`
album=`mpc -f [%album%] current`
#ttime=`mpc -f [%time%] current`
ctime=`mpc|awk 'NR==2 {print $3}'`
#file=`mpc -f [%file%] current`
#notify-send -t 4000 "$ttime / $title / $name" \
#"$artist / $album"
#notify-send -t 4000 "$title" \
#"$name \
#$artist \
#$album \
#$ttime"
#all=`mpc -f [%title%][%name%][%artist%][%album%][%time%] current`
none=true;
if [ -n "$title" ]; then
	all="$title -- "
	none=false
fi
if [ -n "$name" ]; then
	all=$all"$name -- "
	none=false
fi
if [ $none = true ]; then
	file=`mpc -f [%file%] current`
	if [ -n "$file" ]; then
		all="$file -- "
	fi
fi
if [ -n "$artist" ]; then
	all=$all"$artist -- "
fi
if [ -n "$album" ]; then
	all=$all"$album -- "
fi
#if [ -n "$ttime" ]; then
	#all=$all"$ttime"
#fi
if [ -n "$ctime" ]; then
	all=$all"$ctime"
fi
notify-send -t 4000 "$all"
