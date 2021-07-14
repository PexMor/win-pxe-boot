#!/bin/bash

source f00_cfg.sh

echo "List qemu/kvm/libvirt domain block devices"
virsh domblklist $DOM
