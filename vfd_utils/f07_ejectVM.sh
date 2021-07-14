#!/bin/bash

source f00_cfg.sh

if [ ! -f $DN ]; then
    echo "File does not exists '$DN'"
    exit -1
fi

echo "--- blk"
virsh domblklist $DOM
echo "--- eject"
virsh change-media $DOM fda --eject
echo "--- blk"
virsh domblklist $DOM

echo "VM mount '$DN' 2 '$DOM'"
