#!/bin/bash

file=$(find $HOME/Music -iname '*.mp3' | dmenu -i -l 20)
paplay $file
