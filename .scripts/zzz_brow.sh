#!/usr/bin/env zsh

#script example
#visit pages every x days (number argument)
#if $1 then ignore the day parameter, so visits all

if [ -z "$shellc_path" ]; then shellc_path=~/Shell/custom/ ; fi

. "$shellc_path/functions_download.sh"

firefox --private-window
sleep 5

u=zzz_checksums
mkdir -p "$u"

do_check_update_f "firefox --private-window" "http://www.random.com" 2 $u $1 &
do_check_update_f "fiwefox --private-window" "http://www.nananananananananananananananana.com" 6 $u $1 &

