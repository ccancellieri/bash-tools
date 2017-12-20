#ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -f alsa -ac 2 -i hw:0 /tmp/out.mkv
#ffmpeg -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i default $1
#ffmpeg -y -f alsa -i hw:0 -f x11grab -framerate 30 -video_size 1600x900 -i :0.0+0,0 -c:v libx264 -pix_fmt yuv420p -qp 0 -preset ultrafast 
screenSize=`xdpyinfo | grep dimensions | sed -r 's/^[^0-9]*([0-9]+x[0-9]+).*$/\1/'`
ffmpeg -y -f alsa -i hw:0 -f x11grab -framerate 30 -video_size $screenSize -i :0.0+0,0 -c:v libx264 -pix_fmt yuv420p -qp 0 -preset ultrafast $1
