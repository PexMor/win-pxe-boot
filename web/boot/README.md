# boot sub folder

This folder should contain the files references in win.ipxe.

In particular:

* `wimboot` - syslinux/ipxe based `wim` loader
* `bcd` - the boot config data
* `bcd.sdi` - the ramdisk
* `*.wim` - the actual Windows image data found in other folder [sources](../sources)

File type indetified by magic.mgc:

* `wimboot` ~ Linux kernel x86 boot executable bzImage, version v2.7.2, RW-rootFS                                                             
* `boot.sdi` ~  System Deployment Image, PageAlignment 2, checksum 0x39, type PART (0x7) at 0x2000 3161088 bytes DOS/MBR boot sector, code offset 0x52+2, OEM-ID "NTFS    ", Media descriptor 0xf8, sectors/track 2, heads 16, hidden sectors 2, dos < 4.0 BootSector (0x80), FAT (1Y bit by descriptor); NTFS, sectors/track 2, sectors 6173, $MFT start cluster 2058, $MFTMirror start cluster 5162, clusters/RecordSegment 2, clusters/index block 8, serial number 050d60a27d60a0dc2; contains bootstrap NTLDR, type WIM at 0x306000 |

# The Wimboot file

At https://github.com/ipxe/wimboot go to releases and download either 32-bit or 64-bit.

[Wimboot instructions](https://ipxe.org/wimboot)

# The BCD file

To check contents of BCD (boot configuration data).

```
bcdedit 
```

In fact the BCD is a __registry hive__ which can be edited through `regedit.exe` in windows or eventually other tools (linux `pipx regipy`). More on __BCD__ content [bcd.md](../../bcd.md)

# The BCD.SDI file

The windows ramdisk `X:` drive.

[System Deployment Image](https://en.wikipedia.org/wiki/System_Deployment_Image)

# Windows Image format

Wikipedia:[WIM](https://en.wikipedia.org/wiki/Windows_Imaging_Format)


# WinPE details

Howto [WinPE @ iPXE.org](https://ipxe.org/howto/winpe) - good an comprehensive source.

Microsoft [ADK install](https://www.easeus.com/partition-master/create-winpe-bootable-disk-for-all-windows-os.html) to make the actuall WinPE media, mainly the `boot.wim`.

You would need to install only: __Deployment Tools__ and __Windows Preinstallation Environment (Windows PE)__ which needs aprox. __3.6 GB__ of free space - well it contains the Windows files and utilities without the actuall compression ~ `*.wim` to let you modify the file tree. When packed with the `MakeWinPEMedia` it becomes much smaller.

The Windows `install.wim` including __virtio__ drivers for NIC and DISK was around __519 MB__. The plain __WinPE__ could have __200 MB+__.

To copy the WinPE files:

```powershell
copype amd64 D:\WPEx64
copype x86 D:\WPEx86
```

To turn the folder into the CDROM or into ISO image for transfer or sharing:

```powershell
MakeWinPEMedia /UFD D:\WPEx64 I:
MakeWinPEMedia /ISO D:\WPEx64 F:\WPE64.iso
```

[ISO](https://en.wikipedia.org/wiki/ISO_9660) + [extensions](https://en.wikipedia.org/wiki/ISO_9660#Extensions_and_improvements), [UDF](https://en.wikipedia.org/wiki/Universal_Disk_Format), [WIM](https://en.wikipedia.org/wiki/Windows_Imaging_Format)

in linux:

* __UDF__ ~ `mount -t udf /dev/cdrom /mnt/cdrom`
* __WIM__ ~ [WIMlib](https://wimlib.net/) - does a lot incl. NTFS extract, but might be behind the Windows world (~`DISM`), so please consider to use the __Native Windows__

The default install path is `C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit`

`WinPE` tree with `en-us` and `cs-cz` only languages left:

```
amd64
├── en-us
│   └── winpe.wim
├── Media
│   ├── Boot
│   │   ├── BCD
│   │   ├── bootfix.bin
│   │   ├── boot.sdi
│   │   ├── cs-cz
│   │   │   ├── bootmgr.exe.mui
│   │   │   └── memtest.exe.mui
│   │   ├── en-us
│   │   │   ├── bootmgr.exe.mui
│   │   │   └── memtest.exe.mui
│   │   ├── Fonts
│   │   │   ├── chs_boot.ttf
│   │   │   ├── cht_boot.ttf
│   │   │   ├── jpn_boot.ttf
│   │   │   ├── kor_boot.ttf
│   │   │   ├── malgun_boot.ttf
│   │   │   ├── malgunn_boot.ttf
│   │   │   ├── meiryo_boot.ttf
│   │   │   ├── meiryon_boot.ttf
│   │   │   ├── msjh_boot.ttf
│   │   │   ├── msjhn_boot.ttf
│   │   │   ├── msyh_boot.ttf
│   │   │   ├── msyhn_boot.ttf
│   │   │   ├── segmono_boot.ttf
│   │   │   ├── segoen_slboot.ttf
│   │   │   ├── segoe_slboot.ttf
│   │   │   └── wgl4_boot.ttf
│   │   ├── memtest.exe
│   │   └── Resources
│   │       └── bootres.dll
│   ├── bootmgr
│   ├── bootmgr.efi
│   ├── cs-cz
│   │   └── bootmgr.efi.mui
│   ├── EFI
│   │   ├── Boot
│   │   │   ├── bootx64.efi
│   │   │   └── en-us
│   │   │       └── bootx64.efi.mui
│   │   └── Microsoft
│   │       └── Boot
│   │           ├── BCD
│   │           ├── cs-cz
│   │           │   └── memtest.efi.mui
│   │           ├── en-us
│   │           │   └── memtest.efi.mui
│   │           ├── Fonts
│   │           │   ├── chs_boot.ttf
│   │           │   ├── cht_boot.ttf
│   │           │   ├── jpn_boot.ttf
│   │           │   ├── kor_boot.ttf
│   │           │   ├── malgun_boot.ttf
│   │           │   ├── meiryo_boot.ttf
│   │           │   ├── msjh_boot.ttf
│   │           │   ├── msyh_boot.ttf
│   │           │   ├── segmono_boot.ttf
│   │           │   ├── segoe_slboot.ttf
│   │           │   └── wgl4_boot.ttf
│   │           ├── memtest.efi
│   │           └── Resources
│   │               └── bootres.dll
│   └── en-us
│       └── bootmgr.efi.mui
└── WinPE_OCs
    ├── cs-cz
    │   ├── lp.cab
    │   ├── WinPE-DismCmdlets_cs-cz.cab
    │   ├── WinPE-Dot3Svc_cs-cz.cab
    │   ├── WinPE-EnhancedStorage_cs-cz.cab
    │   ├── WinPE-HTA_cs-cz.cab
    │   ├── WinPE-LegacySetup_cs-cz.cab
    │   ├── WinPE-MDAC_cs-cz.cab
    │   ├── WinPE-NetFx_cs-cz.cab
    │   ├── WinPE-PowerShell_cs-cz.cab
    │   ├── WinPE-PPPoE_cs-cz.cab
    │   ├── WinPE-Rejuv_cs-cz.cab
    │   ├── WinPE-RNDIS_cs-cz.cab
    │   ├── WinPE-Scripting_cs-cz.cab
    │   ├── WinPE-SecureStartup_cs-cz.cab
    │   ├── WinPE-Setup-Client_cs-cz.cab
    │   ├── WinPE-Setup_cs-cz.cab
    │   ├── WinPE-Setup-Server_cs-cz.cab
    │   ├── WinPE-SRT_cs-cz.cab
    │   ├── WinPE-StorageWMI_cs-cz.cab
    │   ├── WinPE-WDS-Tools_cs-cz.cab
    │   ├── WinPE-WinReCfg_cs-cz.cab
    │   └── WinPE-WMI_cs-cz.cab
    ├── en-us
    │   ├── lp.cab
    │   ├── WinPE-DismCmdlets_en-us.cab
    │   ├── WinPE-Dot3Svc_en-us.cab
    │   ├── WinPE-EnhancedStorage_en-us.cab
    │   ├── WinPE-HTA_en-us.cab
    │   ├── WinPE-LegacySetup_en-us.cab
    │   ├── WinPE-MDAC_en-us.cab
    │   ├── WinPE-NetFx_en-us.cab
    │   ├── WinPE-PowerShell_en-us.cab
    │   ├── WinPE-PPPoE_en-us.cab
    │   ├── WinPE-Rejuv_en-us.cab
    │   ├── WinPE-RNDIS_en-us.cab
    │   ├── WinPE-Scripting_en-us.cab
    │   ├── WinPE-SecureStartup_en-us.cab
    │   ├── WinPE-Setup-Client_en-us.cab
    │   ├── WinPE-Setup_en-us.cab
    │   ├── WinPE-Setup-Server_en-us.cab
    │   ├── WinPE-SRT_en-us.cab
    │   ├── WinPE-StorageWMI_en-us.cab
    │   ├── WinPE-WDS-Tools_en-us.cab
    │   ├── WinPE-WinReCfg_en-us.cab
    │   └── WinPE-WMI_en-us.cab
    ├── WinPE-DismCmdlets.cab
    ├── WinPE-Dot3Svc.cab
    ├── WinPE-EnhancedStorage.cab
    ├── WinPE-FMAPI.cab
    ├── WinPE-Fonts-Legacy.cab
    ├── WinPE-FontSupport-JA-JP.cab
    ├── WinPE-FontSupport-KO-KR.cab
    ├── WinPE-FontSupport-WinRE.cab
    ├── WinPE-FontSupport-ZH-CN.cab
    ├── WinPE-FontSupport-ZH-HK.cab
    ├── WinPE-FontSupport-ZH-TW.cab
    ├── WinPE-HTA.cab
    ├── WinPE-LegacySetup.cab
    ├── WinPE-MDAC.cab
    ├── WinPE-NetFx.cab
    ├── WinPE-PlatformId.cab
    ├── WinPE-PowerShell.cab
    ├── WinPE-PPPoE.cab
    ├── WinPE-RNDIS.cab
    ├── WinPE-Scripting.cab
    ├── WinPE-SecureBootCmdlets.cab
    ├── WinPE-SecureStartup.cab
    ├── WinPE-Setup.cab
    ├── WinPE-Setup-Client.cab
    ├── WinPE-Setup-Server.cab
    ├── WinPE-StorageWMI.cab
    ├── WinPE-WDS-Tools.cab
    ├── WinPE-WinReCfg.cab
    └── WinPE-WMI.cab

146 directories, 1023 files
```

At `c:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64` you can find essential tools:

| Command      | path                             |
|--------------|----------------------------------|
| bcdboot.exe  | amd64/BCDBoot/bcdboot.exe        |
| bcdedit.exe  | amd64/BCDBoot/bcdedit.exe        |
| bootsect.exe | amd64/BCDBoot/bootsect.exe       |
| dism.exe     | amd64/DISM/dism.exe              |
| imagex.exe   | amd64/DISM/imagex.exe            |
| pkgmgr.exe   | amd64/DISM/pkgmgr.exe            |
| wimserv.exe  | amd64/DISM/wimserv.exe           |
| oacheck.exe  | amd64/Licensing/OA20/oacheck.exe |
| oatool.exe   | amd64/Licensing/OA20/oatool.exe  |
| oa3tool.exe  | amd64/Licensing/OA30/oa3tool.exe |
| oscdimg.exe  | amd64/Oscdimg/oscdimg.exe        |
| wdsmcast.exe | amd64/Wdsmcast/wdsmcast.exe      |
