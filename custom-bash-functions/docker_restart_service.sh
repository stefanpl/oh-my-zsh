#!/bin/bash

###
#
# Force restart of a service running inside a swarm.
# @param $1 – the string which matches a service
#
###
docker_restart_service() {

	if [ -z "$1" ]; then
		echo "Please provide a service-matching expression as the first command line argument"
		return 1
	fi
    serviceNameFragment=$1

	dockerId=`docker_find_service_id ${serviceNameFragment}`
    if [ ${?} -ne 0 ]; then
        echo "Could not get ID from service. Aborting."
        return 1
    fi

	echo 'Updating service …'
	docker service update --force ${dockerId}

}
