# The inspiration for simple iSCSI Target

* client ~ initiator: open-iscsi
* server ~ target: tgt

```bash
apt -yqq install open-iscsi tgt
```

file: __/etc/tgt/conf.d__:

```
<target iqn.2018-02.test.dom:diskone>
    # it can point to LVM2 thin provisioned partition
    backing-store /tmp/disk.raw
    # initiator-address 172.17.0.8
    # incominguser test-iscsi-user password
    # outgoinguser debian-iscsi-target secretpass
</target>
```

```bash
dd if=/dev/zero of=/tmp/disk.raw bs=1M count=128
```

Main process:

```bash
/usr/sbin/tgtd -f
```

Start management commands (taken from systemd service):

```bash
/usr/sbin/tgtadm --op update --mode sys --name State -v offline
/usr/sbin/tgt-admin -e -c /etc/tgt/targets.conf
/usr/sbin/tgtadm --op update --mode sys --name State -v ready
```

Stop commands:

```bash
/usr/sbin/tgtadm --op update --mode sys --name State -v offline
/usr/sbin/tgt-admin --offline ALL
/usr/sbin/tgt-admin --update ALL -c /dev/null -f
/usr/sbin/tgtadm --op delete --mode system
```

and reload command:

```bash
/usr/sbin/tgt-admin --update ALL -c /etc/tgt/targets.conf
```

* tgtadm - Linux SCSI Target Administration Utility
* tgt-admin - Linux SCSI Target Configuration Tool


```bash
tgtadm --mode target --op show
```

```
tgtadm --mode target --op show
Target 1: iqn.2018-02.test.dom:diskone
    System information:
        Driver: iscsi
        State: ready
    I_T nexus information:
    LUN information:
        LUN: 0
            Type: controller
            SCSI ID: IET     00010000
            SCSI SN: beaf10
            Size: 0 MB, Block size: 1
            Online: Yes
            Removable media: No
            Prevent removal: No
            Readonly: No
            SWP: No
            Thin-provisioning: No
            Backing store type: null
            Backing store path: None
            Backing store flags:
        LUN: 1
            Type: disk
            SCSI ID: IET     00010001
            SCSI SN: beaf11
            Size: 134 MB, Block size: 512
            Online: Yes
            Removable media: No
            Prevent removal: No
            Readonly: No
            SWP: No
            Thin-provisioning: No
            Backing store type: rdwr
            Backing store path: /tmp/disk.raw
            Backing store flags:
    Account information:
    ACL information:
        ALL
```

file: __/lib/systemd/system/tgt.service__:

```systemd
[Unit]
Description=(i)SCSI target daemon
Documentation=man:tgtd(8)
After=network.target

[Service]
Type=notify
TasksMax=infinity
ExecStart=/usr/sbin/tgtd -f
ExecStartPost=/usr/sbin/tgtadm --op update --mode sys --name State -v offline
ExecStartPost=/usr/sbin/tgt-admin -e -c /etc/tgt/targets.conf
ExecStartPost=/usr/sbin/tgtadm --op update --mode sys --name State -v ready

ExecStop=/usr/sbin/tgtadm --op update --mode sys --name State -v offline
ExecStop=/usr/sbin/tgt-admin --offline ALL
ExecStop=/usr/sbin/tgt-admin --update ALL -c /dev/null -f
ExecStop=/usr/sbin/tgtadm --op delete --mode system

ExecReload=/usr/sbin/tgt-admin --update ALL -c /etc/tgt/targets.conf
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

https://www.tecmint.com/setup-iscsi-target-and-initiator-on-debian-9/
