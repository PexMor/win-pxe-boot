# boot sub folder

This folder should contain the files references in win.ipxe.

In particular:

* `wimboot` - syslinux/ipxe based `wim` loader
* `bcd` - the boot config data
* `bcd.sdi` - the ramdisk
* `*.wim` - the actual Windows image data found in other folder [sources](../sources)

# The BCD file

To check contents

```
bcdedit 
```

# The BCD.SDI file

The windows ramdisk `X:` drive.
