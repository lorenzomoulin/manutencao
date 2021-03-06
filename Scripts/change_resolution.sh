#!/bin/bash

#script to help people with issues on changing resolution of the monitor
#resolution setted to 1920x1080

password=""
device="DVI-I-1-1"
output="$(cvt 1920 1080 | grep Modeline | awk -F'Modeline ' '{print $2}')"
echo "$password" | sudo -S xrandr --newmode $output
resolution="$(echo $output | awk '{print $1}')"
echo "$password" | sudo -S xrandr --addmode "$device" "$resolution"
