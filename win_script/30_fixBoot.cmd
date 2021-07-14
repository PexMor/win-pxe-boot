@echo off
echo "Unhide and unsystem the BCD file"
attrib -h -s w:\boot\bcd
echo "Remote the obsolete BCD file"
del w:\boot\bcd
echo "Clean boot and master boot sector"
bootsect w: /mbr
echo "Add entry to w:\windows"
bcdboot w:\windows /s w: /f bios
echo "Shortend the timeout 30 -> 3 seconds"
bcdedit /store w:\boot\bcd /timeout 3
rem works only in full windows
rem echo "Clean w:\boot\bcd"
rem bcdboot /bcdclean full
