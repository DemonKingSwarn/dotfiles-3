ffmpeg -f alsa -r 16000 -i hw:2,0 -f video4linux2 -s 800x600 -i /dev/video0 -r 30 -f avi -vcodec mpeg4 -vtag xvid -qscale 0 -acodec libmp3lame -ab 96k output.avi
