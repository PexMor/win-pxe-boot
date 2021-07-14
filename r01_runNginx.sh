#!/bin/bash

docker kill winpe-nginx
docker run -id --rm \
    --name winpe-nginx \
    --network container:winpe \
    -v $(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf \
    -v $(pwd)/web:/usr/share/nginx/html \
    nginx
