#!/bin/sh
acpi -b | awk -F'[,:%]' '{print $2, $3}' | {
	read -r status capacity

	if [ "$status" = Discharging -a "$capacity" -lt 3 ]; then
		logger "Critical battery threshold"
		systemctl hibernate
	fi
}
