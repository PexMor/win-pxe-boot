#!/bin/bash

source f00_cfg.sh

if [ ! -f $DN ]; then
    echo "File does not exists '$DN', please create image file and format it"
    exit -1
fi

echo "Check or create mount folder"
[ -d "$DM" ] || mkdir -p "$DM"

echo "Mount the image into the folder"
mount -o loop "$DN" "$DM"

ls -l "$DM"
echo "mounted @ '$DN'"