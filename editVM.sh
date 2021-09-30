#!/bin/bash

[ -d tmp ] || mkdir -p tmp

WTMP=tmp/tmp.xml

source xml_lib.inc

$XML_CMD fo vm.xml >$WTMP

if [ -f .config.inc ]; then
    source .config.inc
fi

: ${WIN_ISO:=$PWD/rwdata/Win10_21H1_English_x64.iso}

echo "-=[ vda C:"
setDisk 1 $PWD/rwdata/drive-c.qcow2
if [ ! -f "$WIN_ISO" ]; then
    echo "WIN_ISO='$WIN_ISO' file not found"
    exit -1
fi
echo "-=[ sda - cdrom1 D:"
setDisk 2 "$WIN_ISO"
# to get from
BASE=https://fedorapeople.org/groups/virt/virtio-win/direct-downloads
# latest: ${BASE}/stable-virtio/
# universal url:
U_URL=${BASE}/stable-virtio/virtio-win.iso
# curl -I -v $U_URL
# current url:
: ${CUR_URL:=${BASE}/archive-virtio/virtio-win-0.1.208-1/virtio-win-0.1.208.iso}
if [ ! -f "$PWD/rwdata/virtio-win-0.1.208.iso" ]; then
    echo "Missing file: $PWD/rwdata/virtio-win-0.1.208.iso"
    echo "please download from $CUR_URL"
    exit -1
fi
BN=`basename "$CUR_URL"`
echo "-=[ sda - cdrom2 E:"
setDisk 3 $PWD/rwdata/$BN
echo "-=[ fda - floppy A:"
# made by ./install_vfd2media.sh
setDisk 4 $PWD/rwdata/vfd/install.vfd
# replace boot with if needed (default is hd, cdrom, network - if no hd and cdrom try network boot)
# setBoot hd
# set the RAM and CPU
updElVal domain/currentMemory 16
updElVal domain/memory 16
updElVal domain/vcpu 4

# optional settings
# human readable id/name used in virsh commands
# setElVal domain/name wimtest
# the UUID
# uuidgen or cat /proc/sys/kernel/random/uuid
# setElVal domain/uuid 11111111-2222-3333-4444-55555555555

for ID in `seq 1 4`; do
    echo "#$ID"
    $XML_CMD sel -t -c "/domain/devices/disk[$ID]"  tmp/tmp.xml | $XML_CMD fo | highlight -S xml -O xterm256
done

echo "...boot:"
$XML_CMD sel -t -c "/domain/os"  tmp/tmp.xml | $XML_CMD fo | highlight -S xml -O xterm256

echo "...disks:"
$XML_CMD sel -t -m "/domain/devices/disk" -v 'concat(target/@dev,":",source/@file)' -n tmp/tmp.xml
