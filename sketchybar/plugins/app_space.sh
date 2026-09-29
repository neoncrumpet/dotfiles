#!/bin/bash

# SketchyBar runs this once per space item. AeroSpace workspaces are separate
# from macOS Spaces, so use the item name and AeroSpace's focused workspace.
CONFIG_DIR=${CONFIG_DIR:-"$HOME/.config/sketchybar"}
source "$CONFIG_DIR/icons.sh"

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

label=
shopt -s nocasematch
while IFS= read -r app; do
  [[ -n $app ]] || continue
  case $app in
    *finder*) glyph=$ICON_FILE ;;
    *ghostty*|*terminal*|*iterm*|*warp*) glyph=$ICON_TERM ;;
    *safari*) glyph=$ICON_SAFARI ;;
    *chrome*|*firefox*|*arc*|*edge*|*browser*) glyph=$ICON_WEB ;;
    *zed*|*code*|*xcode*|*intellij*|*emacs*) glyph=$ICON_DEV ;;
    *mail*|*outlook*) glyph=$ICON_MAIL ;;
    *chatgpt*|*messages*|*slack*|*teams*|*discord*|*telegram*) glyph=$ICON_CHAT ;;
    *calendar*) glyph=$ICON_CALENDAR ;;
    *notes*|*obsidian*|*textedit*) glyph=$ICON_NOTE ;;
    *music*|*spotify*) glyph=$ICON_MUSIC ;;
    *vlc*|*quicktime*|*tv*) glyph=$ICON_PLAY ;;
    *) glyph=$ICON_APP ;;
  esac
  label+=" $glyph"
done <<< "$apps"

$SKETCHYBAR --set "$NAME" \
  background.drawing="$selected" \
  icon.highlight="$selected" \
  label.highlight="$selected" \
  label="$label"
