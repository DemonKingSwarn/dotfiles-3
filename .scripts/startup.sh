#!/usr/bin/env sh

# This is the startup script.

# cursor settings
xsetroot -cursor_name left_ptr 

# keyboard settings
## Turns Caps Lock into Control, useful for Emacs
setxkbmap -option ctrl:nocaps
sxhkd &

# system
flameshot &

# rice
picom --experimental-backends -f -b &
dunst &
#$HOME/.scripts/set_wallpaper &
feh --bg-fill $HOME/pix/nordic-wall/ign_mandalorian.jpg &
$HOME/.config/polybar/launch.sh &
wal -i $HOME/pix/nordic-wall/ign_mandalorian.jpg &

while true;
do
	sleep 1
done
