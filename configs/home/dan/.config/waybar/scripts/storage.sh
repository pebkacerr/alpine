#!/bin/sh

warning=20
critical=10

home=$(df -h -P -l "/home" | sed -n '2 p')
root=$(df -h -P -l "/" | sed -n '2 p')

tooltip() {
	fs=$1
	size=$2
	used=$3
	mount=$6

	echo "Device: $fs\nMount: $mount\nUsed: $used / $size" 
}


home_array=($(echo $home | tr " " "\n"))
root_array=($(echo $root | tr " " "\n"))

class=""
used_perc=${home_array[4]}
remaining=$((100 - ${used_perc::-1}))

if [ $remaining -lt $critical ]; then
	class="critical"
elif [ $remaining -lt $warning ]; then
	class="warning"
fi

echo "{ \
	\"text\": \"${home_array[4]}\", \
	\"alt\": \"${root_array[4]}\", \
	\"tooltip\": \"$(tooltip $home)\r\r$(tooltip $root)\", \
	\"class\": \"$class\" \
	}"

