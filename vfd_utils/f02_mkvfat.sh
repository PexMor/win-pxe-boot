#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
XDIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
export XDIR

source $XDIR/f00_cfg.sh

if [ ! -f $DN ]; then
    echo "File does not exists '$DN', create image file first"
    exit -1
fi

echo "Formating the image file to have VFAT structure (FAT16 with long names)"
mkfs.vfat "$DN"

echo "formated '$DN'"