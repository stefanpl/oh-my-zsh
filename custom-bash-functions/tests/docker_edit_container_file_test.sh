#!/bin/bash
scriptDirectory=$( dirname ${BASH_SOURCE[0]} )
cd $scriptDirectory/..

source docker_edit_container_file.sh
source docker_find_container_id.sh

cmd0="docker_edit_container_file work illegalfile" 
echo "Running '${cmd0}'"
${cmd0} 

cmd1="docker_edit_container_file illegalContainer anything" 
echo "Running '${cmd1}'"
${cmd1}

cmd2="docker_edit_container_file fpm /usr/local/etc/php/conf.d/xdebug.ini" 
echo "Running '${cmd2}'"
${cmd2}
