ARG NGINX_VER="1.22.0"
ARG NGINX_IMAGE="nginx"

FROM ${NGINX_IMAGE}:${NGINX_VER}

RUN apt-get update && apt-get install -y bc procps numactl

#COPY nginx.conf /usr/local/share/nginx/conf/nginx.conf

