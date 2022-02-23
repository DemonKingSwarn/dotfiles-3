#!/bin/sh
path="$HOME/vids/recordings"
name=$(printf '%s' "$*" | dmenu -i -p "Enter file name:" | tr ' ' '-')
ffmpeg -f x11grab -r 25 -i :0.0 -f pulse -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor "$path/$name.mp4"
ffmpeg -i "$path/$name.mp4" -f mp4 "$path/$name.mp4" 
notify-send "ffmpeg" "recording ended"
