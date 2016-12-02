#!/usr/bin/env zsh
while true;
do
	ipn=$(curl icanhazip.com)
	if ! [ "$ipn" = "$ip" ]; then
		ip=$ipn
		echo $ipn>~/Dropbox/Public/ip_"$HOST"
	fi
	sleep 120
done
