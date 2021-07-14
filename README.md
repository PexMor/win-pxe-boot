# win-pxe-boot

Reference for making Windows (10) boot from network/PXE i.e. inside KVM/QEMU

The purpose of this collection of script is to capture the process of network booting the Windows in particular WinPE. Tested on Windows 10 (19H2), but should work on any Windows10+ eventually also for older versions but that might need some tweaks.

## Quick start:

* [tftp/simple.ipxe](tftp/simple.ipxe) - to switch from __TFTP__ to __HTTP__
* [web/next.ipxe](web/next.ipxe) - the next stage loaded over __HTTP__
* `web/wimboot` - the magic wimboot (bootloader, download at: https://github.com/ipxe/wimboot/releases)
* `web/boot/bcd` - the boot config (registry hive, get from WinPE ISO)
* `web/boot/bcd.sdi` - the ramdisk (X: drive, get from WinPE ISO)
* `web/sources/winpe.wim` - the actuall Windows PE (expanded into X:, get from WinPE ISO)

Section on [making WinPE ISO](web/boot#winpe-details).

The just start the:

0. make the network switch for testing `brhost`
1. dnsmasq (host) - DHCP + DNS + TFTP server, listen on `brhost` IP
2. nginx web server (dockerized) - HTTP SERVER, listen on `brhost` IP
3. kvm/qemu to test (see example at the end of this file)

### OpenVSwitch brhost

Transient network:

```bash
BRN=brhost
OIF=eth0
# make device
ovs-vsctl add-br $BRN
# set device up
ip link set dev $BRN up
# set ip
ip address add 192.168.100.1/24 dev $BRN
# Optional: configure forwarding and SNAT
iptables -I FORWARD -i $BRN -o $OI -j ACCEPT
iptables -I FORWARD -o $BRN -i $OI -j ACCEPT
iptables -t nat -I POSTROUTING -o $OIF -j MASQUERADE
# you might need to change '-I' to '-A' eventually
# in case you have bridge traffic filtered in some way
# /etc/sysctl.d/50-no-bridge-iptables.conf
net.bridge.bridge-nf-call-ip6tables = 0
net.bridge.bridge-nf-call-iptables = 0
net.bridge.bridge-nf-call-arptables = 0
# sysctl -p /etc/sysctl.d/50-no-bridge-iptables.conf
# to turn that filtering off completely - just for testing
# in other cases you might need to tweak the rules in a way
# that it let through the legitimate traffic
# this might become complex :-) with IPv4/6 and ARP
```

## Slow start

Principal steps:

1. Get `winpe.wim` [more](web/boot/README.md), `boot.wim` or `install.wim` from install ISO/CDROM @ `\sources\boot.wim` or `\sources\install.wim`
2. Configure and run `DHCP` and `HTTP` servers (good tip is to use `dnsmasq`, `nginx` and optionally `php-fpm`)
3. Test everything with KVM/QEMU (boot>network)
4. Use on your network as needed

Microsoft on [boot process](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc771845(v=ws.10))

> Note: The __WinPE__ is a base Windows Image, that can turn into __install__, __WinRE__ or other purpose short-lived instance of windows, with limited capabilities (i.e. w/o USERs, extra SW). There is a option to customize the bare image using [winpeshl.ini](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpeshlini-reference-launching-an-app-when-winpe-starts) an [example](https://ipxe.org/howto/winpe#adding_a_startup_batch_file) and/or [startnet.cmd](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/wpeinit-and-startnetcmd-using-winpe-startup-scripts)

You might find useful to manipulate the `*.wim` images using [dism](https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/dism-image-management-command-line-options-s14)

The __magic__ is done by __wimboot__ for [technical internals](https://ipxe.org/appnote/wimboot_architecture) check the [ipxe.org/wimboot](https://ipxe.org/wimboot) web.

## Define virtual machine to test things

The way to build the virsh image can be following:

```bash
#!/bin/bash

set -x
set -e

VM_NAME=pxetest
VM_CPU=1
VM_NET_NAME=brhost
VM_NIC_MAC=52:54:00:00:00:01
VM_RAM=2048

virt-install \
    --dry-run \
    --import \
    --print-xml \
    --name=${VM_NAME} \
    --arch=x86_64 \
    --vcpus=${VM_CPU} \
    --cpu=host \
    --os-type=windows \
    --os-variant=win10 \
    --network bridge=${VM_NET_NAME},mac=${VM_NIC_MAC},model=virtio \
    --graphics vnc,listen=0.0.0.0,port=5900 \
    --hvm \
    --video model=virtio,model.vram=16384 \
    --ram=${VM_RAM} \
    --boot network \
| tee vm.xml
```

That yields file `virsh.xml` similar to this:

```xml
<domain type='kvm'>
  <name>pxetest</name>
  <uuid>11111111-08ce-48c1-a1d4-17522cfc675b</uuid>
  <metadata>
    <libosinfo:libosinfo xmlns:libosinfo="http://libosinfo.org/xmlns/libvirt/domain/1.0">
      <libosinfo:os id="http://microsoft.com/win/10"/>
    </libosinfo:libosinfo>
  </metadata>
  <memory unit='GiB'>2</memory>
  <currentMemory unit='GiB'>2</currentMemory>
  <vcpu placement='static'>1</vcpu>
  <os>
    <type arch='x86_64' machine='pc-q35-rhel7.6.0'>hvm</type>
    <boot dev='network'/>
  </os>
  <features>
    <acpi/>
    <apic/>
    <hyperv>
      <relaxed state='on'/>
      <vapic state='on'/>
      <spinlocks state='on' retries='8191'/>
    </hyperv>
  </features>
  <cpu mode='host-model' check='partial'>
    <model fallback='allow'/>
  </cpu>
  <clock offset='localtime'>
    <timer name='rtc' tickpolicy='catchup'/>
    <timer name='pit' tickpolicy='delay'/>
    <timer name='hpet' present='no'/>
    <timer name='hypervclock' present='yes'/>
  </clock>
  <on_poweroff>destroy</on_poweroff>
  <on_reboot>destroy</on_reboot>
  <on_crash>destroy</on_crash>
  <on_lockfailure>poweroff</on_lockfailure>
  <pm>
    <suspend-to-mem enabled='no'/>
    <suspend-to-disk enabled='no'/>
  </pm>
  <devices>
    <emulator>/usr/libexec/qemu-kvm</emulator>
    <disk type='file' device='cdrom'>
      <driver name='qemu' type='raw'/>
      <target dev='sda' bus='sata'/>
      <readonly/>
      <address type='drive' controller='0' bus='0' target='0' unit='0'/>
    </disk>
    <disk type='file' device='cdrom'>
      <driver name='qemu' type='raw'/>
      <target dev='sdb' bus='sata'/>
      <readonly/>
      <address type='drive' controller='0' bus='0' target='0' unit='1'/>
    </disk>
    <disk type='file' device='floppy'>
      <driver name='qemu' type='raw'/>
      <target dev='fda' bus='fdc'/>
      <address type='drive' controller='0' bus='0' target='0' unit='0'/>
    </disk>
    <controller type='usb' index='0' model='qemu-xhci' ports='15'>
      <address type='pci' domain='0x0000' bus='0x02' slot='0x00' function='0x0'/>
    </controller>
    <controller type='sata' index='0'>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x1f' function='0x2'/>
    </controller>
    <controller type='pci' index='0' model='pcie-root'/>
    <controller type='pci' index='1' model='pcie-root-port'>
      <model name='pcie-root-port'/>
      <target chassis='1' port='0x10'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x0' multifunction='on'/>
    </controller>
    <controller type='pci' index='2' model='pcie-root-port'>
      <model name='pcie-root-port'/>
      <target chassis='2' port='0x11'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x1'/>
    </controller>
    <controller type='pci' index='3' model='pcie-root-port'>
      <model name='pcie-root-port'/>
      <target chassis='3' port='0x12'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x2'/>
    </controller>
    <controller type='pci' index='4' model='pcie-root-port'>
      <model name='pcie-root-port'/>
      <target chassis='4' port='0x13'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x3'/>
    </controller>
    <controller type='pci' index='5' model='pcie-root-port'>
      <model name='pcie-root-port'/>
      <target chassis='5' port='0x14'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x02' function='0x4'/>
    </controller>
    <controller type='fdc' index='0'/>
    <interface type='bridge'>
      <mac address='52:54:00:00:00:01'/>
      <source bridge='brhost'/>
      <model type='virtio'/>
      <address type='pci' domain='0x0000' bus='0x01' slot='0x00' function='0x0'/>
    </interface>
    <serial type='pty'>
      <target type='isa-serial' port='0'>
        <model name='isa-serial'/>
      </target>
    </serial>
    <console type='pty'>
      <target type='serial' port='0'/>
    </console>
    <input type='tablet' bus='usb'>
      <address type='usb' bus='0' port='1'/>
    </input>
    <input type='mouse' bus='ps2'/>
    <input type='keyboard' bus='ps2'/>
    <graphics type='vnc' port='5900' autoport='no' listen='0.0.0.0'>
      <listen type='address' address='0.0.0.0'/>
    </graphics>
    <video>
      <model type='virtio' vram='16384' heads='1' primary='yes'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x01' function='0x0'/>
    </video>
    <memballoon model='virtio'>
      <address type='pci' domain='0x0000' bus='0x04' slot='0x00' function='0x0'/>
    </memballoon>
  </devices>
</domain>
```

You might find useful to add the target disk image for installation or floppy with drivers or iso with drivers. Eventually the second ISO with install files if not using the SMB share. You can also benefit from WinPE to `dism /Image-Apply` a `wim` file to the target disk. It is fast and convenient. Please do not forget to fix, update the `MBR`, partition `bootsect` or `EFI` partition as needed to make the disk bootable.

## Getting into PXE

The network booting can be complicated. There are at least two boot environments the __BIOS__ and __UEFI__. Not taking into account the CoreBoot (former LinuxBoot). The initial test environment was __BIOS__ based KVM virtual machine.

The common issue is also gathering the correct files based on your __PXE__ environment.
It migh be `pxelinux.0`, `undi.kpxe`, `boot32.efi`, `boot64.efi`. Also the subsequent stage `wimboot` requires few files from windows install `ISO` like `bcd`, `bcd.sdi`. Some other files are used directly from the `WIM` file.
