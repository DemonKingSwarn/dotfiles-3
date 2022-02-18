#!/bin/bash
[ -z "$1" ] && exit
n=$'\n'
echo "${@}${n}*${@}*${n}**${@}**${n}***${@}***${n}__***${@}***__" | xclip -selection clipboard
xdotool key ctrl+v
sleep 0.1
xdotool key Return


