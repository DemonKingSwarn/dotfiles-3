#!/bin/sh

name=$(printf '%s' "$*" | dmenu -i -p "Enter file name:" | tr ' ' '-')
notify-send "ffmpeg" "Recording started"
ffmpeg -f x11grab -r 25 -i :0.0  "$HOME/vids/recordings/$name.mp4"
