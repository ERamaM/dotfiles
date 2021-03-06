#!/usr/bin/env zsh
#$1 origin (from where to copy/link)
#$2 destinity (where to copy/link)


if [ -z "$sourced_functions_file" ]; then
	sourced_functions_file=true
	if [ -z "$shellc_path" ]; then shellc_path=. ; fi
	if [ -s "$shellc_path/functions_file.sh" ]; then
		. "$shellc_path/functions_file.sh"
	else
		#We need this to properly include (file not found otherwise)
		wget -P /tmp/ https://raw.githubusercontent.com/andresgomezvidal/zsh_conf/master/custom/functions_file.sh
		. /tmp/functions_file.sh
	fi
	if [ -s "$shellc_path/functions_min.sh" ]; then
		. "$shellc_path/functions_min.sh"
	else
		wget -P /tmp/ https://raw.githubusercontent.com/andresgomezvidal/zsh_conf/master/custom/functions_min.sh
		. /tmp/functions_min.sh
	fi
fi


if [ -n "$1" ]; then
	ori="$1"
else
	echo -n "Use ~/dotfiles as origin?: [Y/n]"
	read REPLY
	echo ""		# (optional) move to a new line
	if ! [[ $REPLY =~ ^[Nn]$ ]]; then
		ori=~/dotfiles
	else
		ori="$(readlink -m "$0")"
		ori="$(dirname "$ori")"
	fi
fi
echo "Origin path is $ori"

if [ -n "$2" ]; then
	dest="$2"
elif [ -d /data ]; then
	dest=/data
else
	dest=~
fi
echo "Destination path is $dest"


echo -n "Download repo?: [Y/n]"
read REPLY
echo ""		# (optional) move to a new line
if ! [[ $REPLY =~ ^[Nn]$ ]]; then
	tmp=/tmp/gagvdotfiles
	echo "Downloading repo"
	#Delete a previous dowloaded gagvdotfiles
	if [ -d $tmp ]; then
		rm -rf $tmp
	fi

	github_clone_donwload_f andresgomezvidal/dotfiles "$tmp"
	echo "Moving repo"
	for i in "$tmp"/{,.}*
	do
		#Copy recursive so as not to ask every time to overwrite
		base=`basename $i`
		cp -rf "$i" "$ori/$base"
	done
fi
cd "$ori"

#Sometimes the script doesn't include well the functions so we do this hax.
if [ -n $(type -t ln_cp_bak_question_f) ]; then
	#Deactivate this to include properly
	sourced_functions_file=false
	wget -P /tmp/ https://raw.githubusercontent.com/andresgomezvidal/zsh_conf/master/custom/functions_file.sh
	. /tmp/functions_file.sh
	wget -P /tmp/ https://raw.githubusercontent.com/andresgomezvidal/zsh_conf/master/custom/functions_min.sh
	. /tmp/functions_min.sh
	sourced_functions_file=true
fi

ln_cp_bak_question_f

if [ -n "$fun" ]; then
	mkdir -p "$ori"/.vim
	mkdir -p "$dest"/.local/share
	mkdir -p "$dest"/.config

	$fun "$ori"/lesskeys "$dest"/lesskeys
	$fun "$ori"/Templates "$dest"/Templates
	$fun "$ori"/.conkyrc "$dest"/.conkyrc
	$fun "$ori"/.latexmkrc "$dest"/.latexmkrc
	$fun "$ori"/.licenses "$dest"/.licenses
	$fun "$ori"/.qjoypad3 "$dest"/.qjoypad3
	$fun "$ori"/.selected_editor "$dest"/.selected_editor
	$fun "$ori"/.xinitrc "$dest"/.xinitrc
	$fun "$ori"/.Xmodmap "$dest"/.Xmodmap

	$fun "$ori"/.fonts "$dest"/.local/share/.fonts

	$fun "$ori"/.config/openbox "$dest"/.config/openbox
	$fun "$ori"/.config/caja "$dest"/.config/caja
	$fun "$ori"/.config/tint2 "$dest"/.config/tint2
	$fun "$ori"/.config/redshift.conf "$dest"/.config/redshift.conf
	$fun "$ori"/.config/terminator "$dest"/.config/terminator
	$fun "$ori"/.config/vlc "$dest"/.config/vlc

	$fun "$ori"/.vimrc "$dest"/.vimrc
	$fun "$ori"/.vimrc "$dest"/.nvimrc
	$fun "$ori"/.vimrc "$dest"/.config/nvim/init.vim

	echo "Installing vundle for vim"
	git_clone_download_f https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	echo -n "Do you want to download all vim's plugins now?: [Y/n]"
	read REPLY
	echo ""		# (optional) move to a new line
	if ! [[ $REPLY =~ ^[Nn]$ ]]; then
		vim +PluginUpdate +qall
	fi
else
	echo "No action selected"
fi
