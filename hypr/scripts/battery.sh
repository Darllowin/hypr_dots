#!/bin/bash
# Low battery notifier

iDIR="$HOME/.config/mako/icons"

# Kill already running processes
already_running="$(ps -fC 'grep' -N | grep 'battery.sh' | wc -l)"
if [[ $already_running -gt 1 ]]; then
	pkill -f --older 1 'battery.sh'
fi

while [[ 0 -eq 0 ]]; do
	battery_status="$(cat /sys/class/power_supply/BAT1/status)"
	battery_charge="$(cat /sys/class/power_supply/BAT1/capacity)"

	if [[ $battery_status == 'Discharging' && $battery_charge -le 85 ]]; then
		if   [[ $battery_charge -le 15 ]]; then
			notify-send --icon="$iDIR/battery-low.png" --urgency=critical "Battery critical!" "${battery_charge}%"
			sleep 180
		fi
	else
		sleep 600
	fi
done
