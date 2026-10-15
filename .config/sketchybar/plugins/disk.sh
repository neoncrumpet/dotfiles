#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

DISK=$(df -lh | grep /dev/disk3s5 | awk '{print $5}')

sketchybar --set $NAME icon="􀤂" \
	icon.color=$COLOR_SYSTEM \
	label=" $DISK " \
	label.color=$COLOR_SYSTEM
