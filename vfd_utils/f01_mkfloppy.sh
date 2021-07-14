#!/bin/bash

source f00_cfg.sh

if [ -f $DN ]; then
    echo "File exists '$DN', please (re)move to create new one."
    exit -1
fi

echo "Creating 1.44MB floppy drive"
dd \
    if=/dev/zero \
    of=$DN \
    bs=512 count=2880

echo "created '$DN'"