if exist C:\script.bat del C:\script.bat

mkdir %WINDIR%\Setup\Scripts

rem Disable password expiration for vagrant and Administrator users
echo wmic useraccount where "name='user'" set passwordexpires=false ^>^> %%WINDIR%%\Temp\SetupComplete.log >> %WINDIR%\Setup\Scripts\SetupComplete.cmd
echo wmic useraccount where "name='Administrator'" set passwordexpires=false ^>^> %%WINDIR%%\Temp\SetupComplete.log >> %WINDIR%\Setup\Scripts\SetupComplete.cmd

rem Disable WinRM when until Windows is not fully initialized / started
netsh advfirewall firewall set rule name="Allow WinRM HTTPS" new action=block
netsh advfirewall firewall set rule name="Windows Remote Management (HTTP-In)" new action=block
echo netsh advfirewall firewall set rule name="Allow WinRM HTTPS" new action=allow ^>^> %%WINDIR%%\Temp\SetupComplete.log >> %WINDIR%\Setup\Scripts\SetupComplete.cmd
echo netsh advfirewall firewall set rule name="Windows Remote Management (HTTP-In)" new action=allow ^>^> %%WINDIR%%\Temp\SetupComplete.log >> %WINDIR%\Setup\Scripts\SetupComplete.cmd

rem if you specify the unattend.xml path then the file is !copied! to Windows sub-folder...
rem while when unspecified it is read from ordered set of places including a: ~ floppy (image)
rem so you can customize on first run as needed!
%WINDIR%\System32\Sysprep\sysprep.exe /generalize /oobe /shutdown /unattend:A:\unattend.xml
