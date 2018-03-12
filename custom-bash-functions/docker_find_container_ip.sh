#!/bin/bash

###
#
# Extract the IP from a docker container matching a given string
# @param $1 – the string which matches a container
#
###
docker_find_container_ip() {

	if [ -z "$1" ]; then
		echo "Please provide a container-matching expression as the first command line argument"
		return 1
	fi

	dockerId=`docker_find_container_id ${1}`

	echo "IP Addresses for docker container ${dockerId}:"
	docker inspect ${dockerId} | grep -iE "ip.*address.*([0-9]{1,3})+" | perl -p -e "s/^[^:]+: \"([.0-9]+).*$/\$1/g" | uniq
}
