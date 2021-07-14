#!/bin/bash

[ -d rwdata/share ] || mkdir -p rwdata/share

docker kill winpe-smbd
docker run -d --rm \
    --name winpe-smbd \
    --network container:winpe \
    -v $(pwd)/rwdata/share:/share \
    -v $(pwd)/win_script:/script \
    dperson/samba \
    -s "public;/share" \
    -s "script;/script"
