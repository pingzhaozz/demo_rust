#! /bin/bash

docker ps -a -q | xargs docker rm -f

module="warp"

docker run -p 3000:3000 -td server.${module}

container_ip=$(docker ps -a -q  | xargs docker inspect | jq -r '.[0].NetworkSettings.IPAddress')

wrk --latency -t200 -c500 -d18s http://${container_ip}:3000/user/wang


