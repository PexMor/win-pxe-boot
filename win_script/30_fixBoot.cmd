@echo off
echo "Clean boot and master boot sector"
bootsect w: /mbr
echo "Clean w:\boot\bcd"
bcdboot w: /bcdclean full
echo "Add entry to w:\windows"
bcdboot w:\windows /s w: /f bios
echo "Shortend the timeout 30 -> 3 seconds"
bcdedit /store w:\boot\bcd /timeout 10
