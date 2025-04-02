#!/bin/sh

killall hyprpanel
sleep 1  # Small delay to ensure it stops completely
exec /usr/bin/hyprpanel
