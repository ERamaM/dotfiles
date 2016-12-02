#!/usr/bin/env bash

#move each track and its moodbar file (.mood) from probation directory to permanent library


if [ -z "$1" ]; then
	dest=~/Music/Libreria/listas/nuevo
else
	dest="$1"
fi

mkdir -p "$dest"
cd "$dest"

pmp3=~/Music/Libreria/listas/viejo/mp3/
pogg=~/Music/Libreria/listas/viejo/ogg/
pflac=~/Music/Libreria/listas/viejo/flac/
pm4a=~/Music/Libreria/listas/viejo/m4a/
pwav=~/Music/Libreria/listas/viejo/wav/


if [ -d "$pmp3" ]; then
	for FILE in *.mp3; do
	    BASE=${FILE%.mp3}
	    mv -i "$FILE" ."$BASE.mood" "$pmp3"
	done
fi


if [ -d "$pogg" ]; then
	for FILE in *.ogg; do
	    BASE=${FILE%.ogg}
	    mv -i "$FILE" ."$BASE.mood" "$pogg"
	done
fi


if [ -d "$pflac" ]; then
	for FILE in *.flac; do
	    BASE=${FILE%.flac}
	    mv -i "$FILE" ."$BASE.mood" "$pflac"
	done
fi



if [ -d "$pm4a" ]; then
	for FILE in *.m4a; do
	    BASE=${FILE%.m4a}
	    mv -i "$FILE" ."$BASE.mood" "$pm4a"
	done
fi


if [ -d "$pwav" ]; then
	for FILE in *.wav; do
	    BASE=${FILE%.wav}
	    mv -i "$FILE" ."$BASE.mood" "$pwav"
	done
fi
