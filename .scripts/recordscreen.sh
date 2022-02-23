#!/bin/sh

name=$(printf '%s' "$*" | dmenu -i -p "Enter file name:" | tr ' ' '-')
notify-send "ffmpeg" "Recording started"
ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0+100,200 "$HOME/vids/recordings/$name"
