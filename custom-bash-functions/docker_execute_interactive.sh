#!/bin/bash

###
#
# Run an interactive bash shell inside a given container
# @param $1 – the string which matches a container
#
###
docker_execute_interactive() {

	if [ -z "$1" ]; then
		echo "Please provide a container-matching expression as the first command line argument"
		return 1
	fi
    containerName=$1

	dockerId=`docker_find_container_id ${containerName}`
    if [ ${?} -ne 0 ]; then
        echo $dockerId
        echo "Could not get ID from container. Aborting."
        return 1
    fi

	# Using the shift builtin will shift down all params by one.
	# $3 becomes $2, $2 becomes $1
	# This enables us to get all remaining arguments by calling ${*}
	shift
	if [ -z "$1" ]; then
		echo "No command given. Running 'bash' inside container ${dockerId}."
		command=bash
	else
		command=${*}
	fi

	finalCommand="docker exec -ti ${dockerId} ${command}"
	eval ${finalCommand}

}
