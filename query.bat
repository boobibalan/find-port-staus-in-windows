::query.bat

@echo off
PortQry.exe -n %1 -e %2 | find /C "TCP port" > tempfile.txt
set /p ExistFlag=<tempfile.txt
IF %ExistFlag% == 1 GOTO :FOUNDIT

echo %1 was not resolved >> output.txt
GOTO :ENDBAT

:FOUNDIT
set /p=%1 <NUL>> output.txt
PortQry.exe -n %1 -e %2 | findstr /I /r ".*LISTENING.* | .*FILTERED.*" >> output.txt
GOTO :ENDBAT
:ENDBAT
