#!/usr/bin/env sh

# This is the startup script.

# cursor settings
xsetroot -cursor_name left_ptr 

# keyboard settings
## Turns Caps Lock into Control, useful for Emacs
setxkbmap -option ctrl:nocaps
sxhkd &

# system
nm-applet &
flameshot &

# rice
picom --experimental-backends -f -b &
dunst &
#$HOME/.scripts/setbg/set_wallpaper &
$HOME/.scripts/setbg/setbg &
$HOME/.config/polybar/launch.sh &

while true;
do
	sleep 1
done
