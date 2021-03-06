#!/bin/bash

# b: elevate privileges
# requires NOPASS sudo
echo "UID=$UID"
if [ "$UID" -ne 0 ]; then
    echo "Switching to root"
    exec sudo "$0" "$@"
fi
# e: elevate privileges

BD=$PWD/rwdata/vfd
[ -d "$BD" ] || mkdir -p "$BD"

FLOPPY=$BD/floppy.vfd
ISO=$BD/cdrom.iso

dd if=/dev/zero of=$FLOPPY bs=1k count=1440
mkfs.vfat -n "CIDATA" "$FLOPPY"
MNTD="$BD/mount"
[ -d "$MNTD" ] || mkdir -p "$MNTD"
mount -o loop,utf8 -t vfat "$FLOPPY" "$MNTD"
cp -fr "win_script/." "$MNTD/"

pushd "$MNTD"
genisoimage  -input-charset utf-8 -output $ISO -volid cidata -joliet -rock .
popd

umount "$MNTD"
