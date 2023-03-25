#! /bin/bash

if [ $# -eq 0 ];then
    module_list="warp actix axum nginx"
else
    module_list=$1
fi

for module in ${module_list}
  do
    docker build -f ${module}/Dockerfile -t server.${module} --build-arg http_proxy=${http_proxy} --build-arg https_proxy=${https_proxy} --build-arg no_proxy=${no_proxy}  ${module}
  done


