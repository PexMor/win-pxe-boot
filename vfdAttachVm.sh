#!/bin/bash

: ${DOM:=wimtest}
: ${IDN:=rwdata/vfd/floppy.vfd}

IDN=`readlink -f "$IDN"`

echo "Dettach the VFD to fda if attached"
virsh change-media $DOM fda --eject
echo "Attach the VFD to fda"
virsh change-media $DOM fda $IDN --insert
