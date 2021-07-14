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
