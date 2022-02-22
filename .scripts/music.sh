#!/bin/bash

file=$(find $HOME/vids/Music -iname '*.ogg' | dmenu -i -l 20)
mpv $file
