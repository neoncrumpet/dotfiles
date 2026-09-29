sketchybar --add item battery right \
           --set battery script="$PLUGIN_DIR/battery.sh" \
           icon.padding_left=10 \
           icon.color="$BLUE" \
           label.color="$BLUE" \
           label.padding_right=10 \
            update_freq=10 \
           --subscribe battery system_woke