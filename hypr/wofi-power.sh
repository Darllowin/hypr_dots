#!/bin/bash

entries="⇠ Logout\n󰑙 Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|wofi --width 250 --height 240 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

hide_search=True

case $selected in
  logout)
     hyprctl dispatch exit x;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac
