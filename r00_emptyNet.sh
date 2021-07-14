#!/bin/bash -x

CONT_NAME=winpe
BR_NAME=brhost
IPP=192.168.100.2/24
NIC_H=wpe_host
NIC_C=wpe_cont

rin() {
    ip netns exec ${CONT_NAME} "$@"
}

# start container
docker run -d --rm \
    --network none \
    --name ${CONT_NAME} \
    --dns 127.0.0.1 \
    --dns-search demo.iot \
    --hostname router \
    nicolaka/netshoot sleep infinity

brctl addbr $BR_NAME || true
ip li set dev $BR_NAME up

ip link add $NIC_H type veth peer name $NIC_C
ip link set $NIC_H up
brctl addif $BR_NAME $NIC_H

echo "Inspect .State.Running"
docker inspect -f {{.State.Running}} ${CONT_NAME}
echo "Inspect .State.Pid"
docker inspect -f {{.State.Pid}} ${CONT_NAME}

# make sure the container is running
until [ "x`docker inspect -f {{.State.Running}} ${CONT_NAME} || true`" == "xtrue" ]; do
    echo "wait for container/state.running"
    sleep 0.1
done
# wait for pid
until [ "x`docker inspect -f {{.State.Pid}} ${CONT_NAME} || true`" != "x" ]; do
    echo "wait for container/state.pid"
    sleep 0.1
done

# create namespace link
[ -d /var/run/netns ] || mkdir -p /var/run/netns
DPID=$(docker inspect --format '{{ .State.Pid }}' "${CONT_NAME}")
ln -sfT "/proc/$DPID/ns/net" "/var/run/netns/${CONT_NAME}"

ip link set netns ${CONT_NAME} dev $NIC_C

rin ip link set $NIC_C up
rin ip address add $IPP dev $NIC_C

