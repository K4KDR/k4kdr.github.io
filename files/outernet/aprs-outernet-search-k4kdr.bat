@echo off
cls
::
:START
::
:: Download & Search Outernet APRS text files
::
:: Assumes you have FTP enabled on Outernet Pi & wget installed on Windows PC
::
:: Adjust file paths, names, sleep time, & Pi URL for your setup
::
:: ctl-C to break out of program loop
::
d:
::
cd d:\temp\aprs
::
del d:\temp\aprs\messages*
::
wget "ftp://192.168.2.128/Amateur Radio/APRS/APRSAT/messages-0.html"
::
wget "ftp://192.168.2.128/Amateur Radio/APRS/APRSAT/messages-1.html"
::
type messages*|find /I "k4kdr" > k4kdr-outernet-messages.txt
::
cls
::
type d:\temp\aprs\k4kdr-outernet-messages.txt
echo.
echo Last Checked at:
date /t
echo %time%
echo.
echo.
echo ... Monitoring Outernet APRS Messages for "K4KDR"
echo.
echo (~60 second refresh)
echo.
::
::
:: *** Sleep for approx 60 seconds ***
ping -n 60 127.0.0.1 > nul
::
goto START