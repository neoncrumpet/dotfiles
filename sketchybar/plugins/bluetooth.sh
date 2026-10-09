#!/bin/bash

source "$CONFIG_DIR/colors.sh"
source "$CONFIG_DIR/icons.sh"

# Query the native framework instead of generating a system_profiler report.
if LABEL=$(osascript -l JavaScript <<'JXA'
ObjC.import('IOBluetooth');
var devices = $.IOBluetoothDevice.pairedDevices;
var names = [];
for (var i = 0; i < devices.count; i++) {
    var device = devices.objectAtIndex(i);
    if (device.isConnected) {
        names.push(ObjC.unwrap(device.nameOrAddress));
    }
}
names.join(', ');
JXA
); then
    LABEL=${LABEL:---}
else
    sketchybar --set "$NAME" icon="$ICON_BT" \
        icon.color="$COLOR_SYSTEM" label="Unavailable" \
        label.color="$COLOR_SYSTEM"
    printf '%s\n' "bluetooth: unable to query connected devices" >&2
    exit 1
fi

sketchybar --set "$NAME" icon="$ICON_BT" \
    icon.color="$COLOR_SYSTEM" label="$LABEL" \
    label.color="$COLOR_SYSTEM"
