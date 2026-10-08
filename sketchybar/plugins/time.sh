#!/bin/sh

source "$CONFIG_DIR/colors.sh"

LABEL=$(date '+%H:%M')
sketchybar --set "$NAME" label=$LABEL label.color=$COLOR_SYSTEM
