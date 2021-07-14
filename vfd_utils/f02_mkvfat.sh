#!/bin/bash

source f00_cfg.sh

if [ ! -f $DN ]; then
    echo "File does not exists '$DN', create image file first"
    exit -1
fi

echo "Formating the image file to have VFAT structure (FAT16 with long names)"
mkfs.vfat "$DN"

echo "formated '$DN'"