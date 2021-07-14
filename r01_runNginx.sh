#!/bin/bash

docker kill nginx
docker run -id --rm \
    --name nginx \
    --network container:winpe \
    -v $(pwd)/ng.conf:/etc/nginx/conf.d/default.conf \
    -v $(pwd)/web:/usr/share/nginx/html \
    nginx
