#!/bin/bash

: ${DOM:=wimtest}
: ${IDN:=rwdata/vfd/floppy.vfd}

virsh change-media $DOM fda --eject
virsh change-media $DOM fda $IDN --insert
