# PXE environment

Pre-Boot eXecution Environment ~ PXE

[iPXE](https://ipxe.org/) mentions boot protocols :

* HTTP (most often used)
* iSCSI (used when there is a network block storage server = iSCSI target, [see e.g. tecmint](https://www.tecmint.com/setup-iscsi-target-and-initiator-on-debian-9/))
* FCoE (Fibre channel over Ethernet)
* AoE (ATA over Ethernet)
* Infiband
* Wi-Fi
* WAN (Wide Area Network) ~ merely DNS and GW support, full TCP/IP stack

as well as control the boot process with a script (`*.ipxe`).

## Getting the PXE

Your computer might already have the [iPXE](https://ipxe.org/), so you might just skip this chapter. However your implementation might be __stripped down__ and misisng some features so you migh find useful to be able to load __latest and greatest__ iPXE.

> To-do: verify this claim - chain-loading...

Depending on what kind of bootstrap system your NIC has, you have to choose from:

> To-do: check and enhance

| Environemnt | Files                                                 |
|-------------|-------------------------------------------------------|
| Legacy      | undionly.kpxe, undionly.kkpxe, ipxe.pxe and intel.pxe |
| UEFI 64-bit | ipxe64.efi, snponly64.efi and intel64.efi             |
| UEFI 32-bit | ipxe32.efi, snponly32.efi and intel32.efi             |

Where:

 * `efi` ~ Your system is EFI or UEFI type (Universal Extensible Firmware Image)
 * `kpxe` ~ a PXE image that keeps UNDI loaded and unloads PXE
 * `kkpxe` ~ a PXE image that keeps PXE+UNDI loaded and return to PXE (instead of int 18h).
 * `pxe` ~ an image designed to be chain loaded, unloading both the underlying PXE and UNDI (Universal Network Device Interface) code sections.

* https://en.wikipedia.org/wiki/Preboot_Execution_Environment
