#!/bin/bash

CONFIG_DIR=${CONFIG_DIR:-"$HOME/.config/sketchybar"}

workspace=${NAME#space.}
[[ $NAME == space.* && $workspace =~ ^[0-5]+$ ]] || exit 0

AEROSPACE=${AEROSPACE_BIN:-/opt/homebrew/bin/aerospace}
SKETCHYBAR=${SKETCHYBAR_BIN:-/opt/homebrew/bin/sketchybar}

focused=$($AEROSPACE list-workspaces --focused 2>/dev/null) || exit 0
apps=$($AEROSPACE list-windows --workspace "$workspace" --format '%{app-name}' 2>/dev/null) || exit 0

case $workspace in
  "$focused") selected=on ;;
  *) selected=off ;;
esac

$SKETCHYBAR --set "$NAME" \
  background.drawing="$selected" \
  icon.highlight="$selected" \
  label.highlight="$selected" \
