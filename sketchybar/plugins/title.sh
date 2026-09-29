#!/bin/bash

LABEL=$(aerospace list-windows --focused --format '%{app-name}')

if [[ $LABEL = "" ]]; then
  LABEL="Desktop"
fi

sketchybar --set $NAME label="$LABEL"
