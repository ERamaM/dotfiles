#!/usr/bin/env bash


dir=~/.PlayOnLinux/wineprefix/PoE/drive_c/Program\ Files\ \(x86\)/Grinding\ Gear\ Games/Path\ of\ Exile/logs;
client=$dir/Client.txt;
tam=$(stat -c%s "$client");

if [ "$tam" -gt "20024024" ]; then
	tar -czpPv -f ~/My\ Games/Path\ of\ Exile/"Client.txt_"$(date "+%Y-%m-%d-%H:%M")".tar.gz" -C "$dir" Client.txt;
	
	echo " " > "$client";
#	rm "$client";
#	touch "$client";
fi

nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUCurrentFanSpeed=15";

/usr/share/playonlinux/playonlinux --run "PathOfExile" %F && nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUCurrentFanSpeed=10";
