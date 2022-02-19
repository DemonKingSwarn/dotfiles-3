#!/usr/bin/env sh

# rice
xsetroot -cursor_name left_ptr &
picom --experimental-backends -f -b &
sxhkd &
dunst &
$HOME/.scripts/set_wallpaper &
$HOME/.config/polybar/launch.sh &
flameshot &
