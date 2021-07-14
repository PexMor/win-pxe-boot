#!/bin/bash

: ${DOM:=wimtest}
: ${VFD_PATH:=rwdata/vfd/floppy.vfd}

VFD_PATH=`readlink -f "$VFD_PATH"`

echo "Dettach the VFD to fda if attached"
virsh change-media $DOM fda --eject
echo "Attach the VFD (VFD_PATH=$VFD_PATH) to fda"
virsh change-media $DOM fda $VFD_PATH --insert
