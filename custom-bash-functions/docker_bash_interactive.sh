#!/bin/bash

###
#
# Run an interactive bash shell inside a given container
# @param $1 – the string which matches a container
#
###
docker_bash_interactive() {

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

    docker exec -ti ${dockerId} bash

}
