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
    echo "File does not exists '$DN', please create image file and format it"
    exit -1
fi

echo "Check or create mount folder"
[ -d "$DM" ] || mkdir -p "$DM"

echo "Mount the image into the folder"
mount -o loop "$DN" "$DM"

ls -l "$DM"
echo "mounted @ '$DN'"