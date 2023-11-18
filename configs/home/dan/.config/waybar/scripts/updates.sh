#!/bin/sh

pacman_updates="$(checkupdates)"
pacman_updates_count=$([[ -z $pacman_updates ]] && echo 0 || echo -e "$pacman_updates" | wc -l)

if [[ $pacman_updates_count -eq 0 ]]; then
	tooltip="No updates"
else
	tooltip="ArchLinux:\r\r$(echo -e "$pacman_updates" | tr '\n' '\r')"
fi

echo "{ \
	\"text\": \"$pacman_updates_count\", \
	\"tooltip\": \"$tooltip\" \
}"

