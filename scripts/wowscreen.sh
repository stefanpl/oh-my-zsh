#!/bin/bash
modeline=$(cvt 1600 900 60 | perl -p -e 's/Modeline //' | perl -p -e 's/^#.*$\\n//')
echo $modeline
modename=$( echo $modeline | egrep -o '"[0-9x_.]+"' )
echo $modename
xrandr --newmode $modeline
xrandr --addmode VGA1 $modename
xrandr --output VGA1 --mode $modename
