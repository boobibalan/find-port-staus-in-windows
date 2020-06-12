::runquery.bat

@echo off
echo START PortQuery on %Computername% - %date% - %time% > output.txt
set prt=%1
for /F "tokens=*" %%a IN (HostList.txt) DO Query.bat %%a %prt%
