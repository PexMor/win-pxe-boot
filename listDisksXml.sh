#!/bin/bash

[ -d tmp ] || mkdir -p tmp

# XML_CMD=xml
XML_CMD=xmlstarlet

function setDisk() {
    local ID=$1
    local V=$2
    # -P (or --pf)        - preserve original formatting
    # -S (or --ps)        - preserve non-significant spaces
    # -L (or --inplace)   - edit file inplace
    # -u "/domain/devices/disk[$ID]/source/@file" -v "$V" \
    $XML_CMD ed -L \
        -d "/domain/devices/disk[$ID]/source" \
        -s "/domain/devices/disk[$ID]" -t elem --name source -v "" \
        -i "/domain/devices/disk[$ID]/source" -t attr -name file -v "$V" \
        tmp/tmp.xml
}

function setBoot() {
    local V=$1
    $XML_CMD ed -L \
        -d "/domain/os/boot" \
        -s "/domain/os" -t elem --name boot -v "" \
        -i "/domain/os/boot" -t attr -name dev -v "$V" \
        tmp/tmp.xml
}

function setElVal() {
    local P=$1
    local V=$2
    $XML_CMD ed -L \
        -u "$P" -v "$V" \
        tmp/tmp.xml
}

$XML_CMD fo vm.xml >tmp/tmp.xml
# vda C:
setDisk 1 $PWD/rwdata/drive-c.qcow2
# sda - cdrom1 D:
setDisk 2 $PWD/rwdata/Win10_21H1_English_x64.iso
# sda - cdrom2 E:
# to get from BASE=https://fedorapeople.org/groups/virt/virtio-win/direct-downloads
# latest: ${BASE}/stable-virtio/
# universal url: ${BASE}/stable-virtio/virtio-win.iso
# current url: ${BASE}/archive-virtio/virtio-win-0.1.208-1/virtio-win-0.1.208.iso
setDisk 3 $PWD/rwdata/virtio-win-0.1.208.iso
# fda - floppy A:
# made by ./install_vfs2media.sh
setDisk 4 $PWD/vfd/install.vfd
# replace boot with if needed (default is hd, cdrom, network - if no hd and cdrom try network boot)
# setBoot hd
# set the RAM and CPU
setElVal domain/currentMemory 16
setElVal domain/memory 16
setElVal domain/vcpu 4

# setElVal domain/name wimtest
# setElVal domain/uuid 11111111-2222-3333-4444-55555555555

for ID in `seq 1 4`; do
    echo "#$ID"
    $XML_CMD sel -t -c "/domain/devices/disk[$ID]"  tmp/tmp.xml | xml fo | highlight -S xml -O xterm256
done

echo "...boot:"
$XML_CMD sel -t -c "/domain/os"  tmp/tmp.xml | xml fo | highlight -S xml -O xterm256

echo "...disks:"
$XML_CMD sel -t -m "/domain/devices/disk" -v 'concat(target/@dev,":",source/@file)' -n tmp/tmp.xml