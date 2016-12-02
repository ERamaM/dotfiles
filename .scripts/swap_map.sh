#!/usr/bin/env bash

if [ "$(setxkbmap -query |awk 'END{print $2}')" == "us" ]; then
	setxkbmap es;
else
	setxkbmap us;
fi

xmodmap ~/.Xmodmap
