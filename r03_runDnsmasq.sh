#!/bin/bash -x

dnsmasq \
    --conf-file=dnsmasq.conf \
    --keep-in-foreground \
    -R \
    --listen 192.168.100.1
