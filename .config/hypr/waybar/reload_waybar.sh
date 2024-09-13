#!/bin/sh

killall waybar 


waybar -c ~/configuration/.config/hypr/waybar/config.jsonc & -s ~/configuration/.config/hypr/waybar/stylecss
