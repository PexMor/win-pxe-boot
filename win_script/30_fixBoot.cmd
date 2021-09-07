@echo off
echo "Unhide and unsystem the BCD file"
attrib -h -s c:\boot\bcd
echo "Remote the obsolete BCD file"
del c:\boot\bcd
echo "Clean boot and master boot sector"
bootsect c: /mbr
echo "Add entry to c:\windows"
bcdboot c:\windows /s c: /f bios
echo "Shortend the timeout 30 -> 3 seconds"
bcdedit /store c:\boot\bcd /timeout 3
rem works only in full windows
rem echo "Clean c:\boot\bcd"
rem bcdboot /bcdclean full
