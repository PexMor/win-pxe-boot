#!/bin/bash

[ -d rwdata/win ] || mkdir -p rwdata/win
[ -d rwdata/menu ] || mkdir -p rwdata/menu

docker kill winpe-php-fpm
docker run -id --rm \
    --name winpe-php-fpm \
    --network container:winpe \
    -v $(pwd)/rwdata:/rwdata \
    -v $(pwd)/tftp:/tftp \
    -v $(pwd)/web:/usr/share/nginx/html \
    php:7-fpm
