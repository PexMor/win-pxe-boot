#!/bin/bash

: ${DOM:=wimtest}

if [ $# -lt 1 ]; then
    echo "Please provide the ISO path as parameter"
    exit -1
fi

ISO_PATH=$1

echo "Dettach the ISO to sda if attached"
virsh change-media $DOM sda --eject
echo "Attach the ISO to sda"
virsh change-media $DOM sda $ISO_PATH --insert
