#!/bin/sh

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

DISK=$(df -lh | grep /dev/disk3s5 | awk '{print $5}')
BCOLOR=$COLOR_DEFAULT
COLOR=$COLOR_BACKGROUND

"$HOME/.config/sketchybar/bin/bottombar" --set $NAME icon="􀤂" \
	icon.color=$COLOR \
	background.color=$BCOLOR \
	label=" $DISK " \
	label.color=$COLOR
