#!/usr/bin/env zsh
\conky &
\redshift &
\unclutter -idle 30 &
\autokey-gtk &

#udiskie
music_manager
Telegram

if [ "$HOST" = "torre" ]; then
	xrandr --output DVI-I-3 --primary &
	if [ "$(cat /proc/uptime|cut -d . -f1)" -lt "600" ]; then
		file_manager /mybackup/
		file_manager /
		sleep 4
		killall_r $file_manager

		shs_sda
		sleep 60
		shy_sda
	fi
fi


#if ! ps_existsf udiskie; then udiskie & fi
#nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUCurrentFanSpeed=10"
