#!/bin/bash

###
#
# Extract the IP from a docker container matching a given string
# @param $1 – the string which matches a container
#
###
docker_edit_container_file() {

	if [ -z "$1" ]; then
		echo "Please provide a container-matching expression as the first command line argument"
		return 1
	fi
    containerName=$1

    if [ -z "$2" ]; then
        echo "Please provide a file path as the second command line argument"
        return 1
    fi
    remoteFilePath=$2

	dockerId=`docker_find_container_id ${containerName}`
    if [ ${?} -ne 0 ]; then
        echo $dockerId
        echo "Could not get ID from container. Aborting."
        return 1
    fi

    localFile=`mktemp`

    docker cp ${dockerId}:${remoteFilePath} ${localFile} || \
        { echo "Could not copy file from container. Aborting." ; return 1 ; }

    vim ${localFile}

    docker cp ${localFile} ${dockerId}:${remoteFilePath}

}
