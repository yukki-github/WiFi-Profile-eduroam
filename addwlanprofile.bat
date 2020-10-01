@echo off

set prof="eduroam"
set xmlfile=".\Wi-Fi-eduroam.xml"

cd /d %~dp0

netsh wlan show profiles | find %prof% > nul

rem if exist wlan profile eduroam delete 
if not ERRORLEVEL 1 (netsh wlan delete profile name=eduroam)

timeout 2
rem add wlan profile
netsh wlan add profile filename=%xmlfile%
