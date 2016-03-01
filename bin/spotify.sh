album=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 2 "album"|egrep -v "album"|egrep -v "array"|cut -b 44-|cut -d '"' -f 1|egrep -v ^$`
artist=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 2 "artist"|egrep -v "artist"|egrep -v "array"|cut -b 27-|cut -d '"' -f 1|egrep -v ^$`
title=`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata'|egrep -A 1 "title"|egrep -v "title"|cut -b 44-|cut -d '"' -f 1|egrep -v ^$`

mpsyt=`(pgrep mpv | xargs ps -o command | grep -o -P '(?<=--title ).*(?= --really-quiet)') | head -n 1 | cut -c1-40`
spotify="$artist - $title"

echo -n '#[fg=$tm_color_music]'

if [ ! -z "$title" -a "$title"!=" " ]; then
        echo -n "♫ $spotify "
fi

if [ ! -z "$mpsyt" -a "$mpsyt" != ').*(?=' ]; then
        echo -n " ♫ $mpsyt... "
fi
