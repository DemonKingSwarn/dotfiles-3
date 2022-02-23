#!/usr/bin/env sh

# rice
xsetroot -cursor_name left_ptr &
picom --experimental-backends -f -b &
sxhkd &
dunst &
#$HOME/.scripts/set_wallpaper &
feh --bg-fill $HOME/pix/nordic-wall/ign_mandalorian.jpg &
$HOME/.config/polybar/launch.sh &
wal -i $HOME/pix/nordic-wall/ign_mandalorian.jpg &
flameshot &
setxkbmap -option ctrl:nocaps
