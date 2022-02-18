#!/bin/sh

ffmpeg -f x11grab -s 1366x768 -i :1 out.mkv
