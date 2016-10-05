#!bin/bash
sleep 200ms;
xdotool key Control_L+c 
sleep 100ms;
xclip -o -selection c | xclip -i -selection c 
