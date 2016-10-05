#!bin/bash
xrandr --newmode "works" 146.25  1680 1784 1960 2240  1050 1053 1059 1089;
xrandr --addmode VGA1 "works";
xrandr --output VGA1 --mode "works" --left-of LVDS1 --primary;
