#!/bin/bash -x

function runOnHost() {
dnsmasq \
    --conf-file=dnsmasq.conf \
    --keep-in-foreground
}

function runInCont() {
docker kill winpe-dnsmasq
docker run -d --rm \
    --name winpe-dnsmasq \
    --network container:winpe \
    --cap-add NET_ADMIN \
    -v $PWD/dnsmasq.conf:/etc/dnsmasq.conf:ro \
    -v $PWD/tftp:/tftp:ro \
    alvistack/dnsmasq-2.80
}

runInCont
