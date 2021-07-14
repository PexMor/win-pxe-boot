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