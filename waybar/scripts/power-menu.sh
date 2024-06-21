#!/bin/bash

entries="Logout Suspend Reboot Shutdown"

selected=$(printf '%s\n' $entries | wofi --conf=$HOME/.config/wofi/config.power --style=$HOME/.config/wofi/style.widgets.css | awk '{print tolower($1)}')

case $selected in
  logout)
	if [ $DESKTOP_SESSION == Hyprland ]; then
		hyprctl dispatch exit
	elif [ $DESKTOP_SESSION == Sway ]; then
		swaymsg exit
	else 
		echo "Unsupported desktop session: $DESKTOP_SESSION"
		exit 1
	fi;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
