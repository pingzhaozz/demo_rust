#! /bin/bash

if [ $# -eq 0 ];then
    module_list="warp actix axum nginx"
else
    module_list=$1
fi


for module in ${module_list}
  do
    echo "------- Test ${module} --------------" 
    docker ps -a -q | xargs docker rm -f

    sleep 2
    #docker run --name http_server -p 3000:3000 -td server.${module}
    docker run --name http_server -td server.${module}

    container_ip=$(docker ps -a -q  | xargs docker inspect | jq -r '.[0].NetworkSettings.IPAddress')

    sleep 5
    #wrk --latency -t120 -c300 -d18s http://${container_ip}:3000/user/bench
    #wrk --latency -t120 -c300 -d18s http://127.0.0.1:3000/user/bench
    docker run --network container:http_server -v `pwd`:/data williamyeh/wrk --latency -t120 -c300 -d18s http://127.0.0.1:3000/user/bench
    echo "------------------------------------" 
  done

