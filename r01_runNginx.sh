#!/bin/bash

docker kill nginx
docker run -id --rm \
    --name nginx \
    --hostname nginx \
    -p 192.168.100.1:80:80 \
    -v $(pwd)/ng.conf:/etc/nginx/conf.d/default.conf \
    -v $(pwd)/web:/usr/share/nginx/html \
    nginx