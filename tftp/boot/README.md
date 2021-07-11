# boot sub folder

This folder should contain the files references in win.ipxe.

In particular:

* `wimboot` - syslinux/ipxe based `wim` loader
* `bcd` - the boot config data
* `bcd.sdi` - the ramdisk
* `*.wim` - the actual Windows image data found in other folder [sources](../sources)

# The Wimboot file

At https://github.com/ipxe/wimboot go to releases and download either 32-bit or 64-bit.

[Wimboot instructions](https://ipxe.org/wimboot)

# The BCD file

To check contents of BCD (boot configuration data).

```
bcdedit 
```

# The BCD.SDI file

The windows ramdisk `X:` drive.

# WinPE details

[on iPXE](https://ipxe.org/howto/winpe)

[ADK install](https://www.easeus.com/partition-master/create-winpe-bootable-disk-for-all-windows-os.html)

You would need only: __Deployment Tools__ and __Windows Preinstallation Environment (Windows PE)__ which should not eat that much space.

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