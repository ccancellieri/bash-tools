ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -f alsa -ac 2 -i hw:0 /tmp/out.mkv
