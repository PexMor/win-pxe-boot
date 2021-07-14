#!/bin/bash

echo "---"
echo "Those values is good to have =0 for testing"
echo "---[ current values"
sudo sysctl -a  | grep net.bridge.bridge-nf-call-
echo "---[ to set the values temporatily just run:"
cat <<DATA
sudo sysctl net.bridge.bridge-nf-call-arptables=0
sudo sysctl net.bridge.bridge-nf-call-iptables=0
sudo sysctl net.bridge.bridge-nf-call-ip6tables=0
DATA
echo "---[ or you can save name=value pairs one per line into file and the 'sysctl -p file'"
