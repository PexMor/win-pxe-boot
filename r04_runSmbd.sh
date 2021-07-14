#!/bin/bash

[ -d rwdata/share ] || mkdir -p rwdata/share

# change as needed
: ${SHARE_PATH:=$PWD/rwdata/share}

docker kill winpe-smbd
docker run -d --rm \
    --name winpe-smbd \
    --network container:winpe \
    -v $SHARE_PATH:/share \
    -v $PWD/win_script:/script \
    dperson/samba \
    -s "public;/share" \
    -s "script;/script"
