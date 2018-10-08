#!/bin/bash

###
#
# Extract the ID from a docker service matching a given string
# @param $1 – the string which matches a service
#
###
function docker_find_service_id() {
    if [ -z "$1" ]; then
        echo "Please provide a matching expression as the first command line argument"
        return 1
    fi

    match=`docker service ls | grep -i ${1}`
    numberOfMatchedLines=`echo ${match} | grep -E -c "^."`
    if [[ $numberOfMatchedLines == "0" ]]; then
        echo "No result found for expression '${1}'"
        return 1
    fi;
    if [[ $numberOfMatchedLines -gt "1" ]]; then
        echo "Found ${numberOfMatchedLines} matches for expression '${1}':"
        echo "This command expects only one result"
        return 1
    fi;

    # We have exactly one result. Extract it!
    id=`echo ${match} | perl -p -e "s/(^[0-9a-z]*).*/\\$1/"`
    echo $id
    return 0

}
