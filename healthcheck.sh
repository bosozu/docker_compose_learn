#!/bin/bash

#container_id="nginx1"
container_id=$(docker ps -a --format '{{.Names}}')
for container in $container_id;
    do healthcheck=$(docker inspect --format='{{json .State.Health}}' "$container" | jq '.Status')
        # echo $healthcheck 
        if [ $healthcheck = "\"unhealthy"\" ]; then
            echo -e "\033[031m $container: unhealthy \033[0m"
        elif [ $healthcheck = "\"healthy"\" ]; then
            echo -e "\033[032m $container: healthy \033[0m"
        fi
done
    
