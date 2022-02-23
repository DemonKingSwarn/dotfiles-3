#!/bin/sh

name=$(printf '%s' "$*" | dmenu -i -p "Enter file name:" | tr ' ' '-')
notify-send "ffmpeg" "Recording started"
ffmpeg -f x11grab -r 25 -i :0.0 -f pulse -i alsa_output.pci-0000_00_1b.0.analog-stereo.monitor "$HOME/vids/recordings/$name.mp4"
