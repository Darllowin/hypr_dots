#!/usr/bin/env bash

iDIR="$HOME/.config/mako/icons"

# Get brightness
get_backlight() {
    LIGHT="$(brightnessctl -d 'redmibook::kbd_backlight' g)"
    echo "${LIGHT}"
}

# Get icons
get_icon() {
    current="$(brightnessctl -d 'redmibook::kbd_backlight' g)"

    if [[ "$current" -eq "0" ]]; then
        icon="$iDIR/brightness-kdb.png"
    elif [[ "$current" -eq "1" ]]; then
        icon="$iDIR/brightness-kdb.png"
    elif [[ "$current" -eq "2" ]]; then
        icon="$iDIR/brightness-kdb.png"
    elif [[ "$current" -eq "3" ]]; then
        icon="$iDIR/brightness-kdb.png"
    fi
}

# Notify
notify_user() {
    notify-send -h string:x-canonical-private-synchronous:sys-notify -u low -i "$icon" "Keyboard Brightness : $(brightnessctl -d 'redmibook::kbd_backlight' g)"
}

# Cycle brightness
cycle_backlight() {
    current_brightness=$(brightnessctl -d 'redmibook::kbd_backlight' g | tr -d '\n')

    case "$current_brightness" in
        0)
            brightnessctl -d 'redmibook::kbd_backlight' set 1
            ;;
        1)
            brightnessctl -d 'redmibook::kbd_backlight' set 2
            ;;
        2)
            brightnessctl -d 'redmibook::kbd_backlight' set 3
            ;;
        3)
            brightnessctl -d 'redmibook::kbd_backlight' set 0
            ;;
    esac
    get_icon
    notify_user
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
    brightnessctl -d 'redmibook::kbd_backlight' g
elif [[ "$1" == "--cycle" ]]; then
    cycle_backlight
else
    get_backlight
fi
