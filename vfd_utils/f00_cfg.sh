#!/bin/bash

BD=$PWD/../rwdata/vfd
BD=`readlink -f "$BD"`
[ -d "$BD" ] || mkdir "$BD"
DN=$BD/new_floppy.vfd
DM=$BD/tmp_mnt
# inside container path (when you might be running on e.g. Openstack env.)
# IDN=/var/lib/nova/iso/`basename "$DN"`
IDN=$DN

: ${DOM:=wimtest}
