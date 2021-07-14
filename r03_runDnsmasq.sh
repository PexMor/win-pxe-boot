#!/bin/bash -x

function runOnHost() {
dnsmasq \
    --conf-file=dnsmasq.conf \
    --keep-in-foreground \
}

function runInCont() {
docker run -d --rm \
    --name dnsmasq \
    --network container:winpe \
    -v $PWD/dnsmasq.conf:/mnt/dnsmasq/dnsmasq.conf:ro \
    -v $PWD/tftp:/tftp:ro \
    devries/dnsmasq
}

runInCont
