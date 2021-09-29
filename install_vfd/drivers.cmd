rem switch to the second cdrom
E:
cd \amd64\win10
rem storage driver(s)
drvload viostor.inf
drvload vioscsi.inf
rem network card driver
cd \NetKVM\w10\amd64
drvload netkvm.inf
rem initialize the network
call startnet.cmd
rem show ipconfig
ipconfig
