#!/bin/bash

[ -d tmp ] || mkdir -p tmp

WTMP=tmp/auto.xml

source xml_lib.inc

# create working copy
$XML_CMD fo install_vfd/Autounattend.xml >$WTMP

if [ -f .config.inc ]; then
    source .config.inc
fi

: ${PROD_KEY:=put-a-prod-key-to-PROD_KEY-env-var}

# edit the file
delEl _:unattend/_:settings/_:component/_:UserData/_:ProductKey
setElVal _:unattend/_:settings/_:component/_:UserData ProductKey ""
setElVal _:unattend/_:settings/_:component/_:UserData/_:ProductKey Key "$PROD_KEY"
setElVal _:unattend/_:settings/_:component/_:UserData/_:ProductKey WillShowUI Never
