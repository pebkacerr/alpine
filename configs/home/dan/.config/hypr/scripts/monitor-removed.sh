#!/bin/sh

handle() {
	readarray -t inputArr < <(echo "${1//>>/$'\n'}")

	if [[ ${#inputArr[@]} != 2 ]]; then
    		echo "Unrecognized format: $1"
    		return
  	fi

	event=${inputArr[0]}
  	data=${inputArr[1]}

	echo " HYPR -> $event $data"  
}

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done

