#!/bin/bash
chokidar docker_find_container_id -c "clear && unfunction docker_find_container_id && source ./../.zshenv && {  docker_find_container_id work }" -p
