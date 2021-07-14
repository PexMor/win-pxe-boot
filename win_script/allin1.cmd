a:
cd \
call 00_smb_mount.cmd
call 10_mkDisk.cmd
z:
cd \
call a:\20_applyWim.cmd
a:
call a:\30_fixBoot.cmd
call a:\90_smb_unmount.cmd
call a:\40_shutdown.cmd
