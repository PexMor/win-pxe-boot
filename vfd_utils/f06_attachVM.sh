#!/bin/bash

source f00_cfg.sh

if [ ! -f $DN ]; then
    echo "File does not exists '$DN', please create the image, format and fill"
    exit -1
fi

echo "--- blk"
virsh domblklist $DOM
echo "--- eject"
virsh change-media $DOM fda --eject
echo "--- insert"
virsh change-media $DOM fda $IDN --insert
echo "--- blk"
virsh domblklist $DOM

echo "VM mount '$DN' @ '$DOM'"
