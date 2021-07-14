# The QEMU/KVM floppy handling suite

How to work with removable media on floppy example.

| Script          | Purpose                                                       |
|-----------------|---------------------------------------------------------------|
| f00_cfg.sh      | Variable used by other scripts, modifications should go here  |
| f01_mkfloppy.sh | Create floppy image file (simple `dd` making 1.44MB )         |
| f02_mkvfat.sh   | `format` the image                                            |
| f03_mount.sh    | `mount` the image as VFAT                                     |
| f04_umount.sh   | `unmount` conterpart                                          |
| f05_vmList.sh   | virsh list removable (`domblklist`) block devices             |
| f06_attachVM.sh | `attach` the newly create file                                |
| f07_ejectVM.sh  | `dettach` the image and leave the removable device slot empty |
