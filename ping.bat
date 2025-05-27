@echo off
cls 

::set /p website="What website do you want to ping? "
::set website="8.8.8.8"

::type nul > cache.txt


(
echo @echo off
echo timeout /t  /nobreak > nul 
echo ping -n 1 8.8.8.8 ^> cache.txt
echo exit
) > temp_cmd.bat

timeout /t 1 /nobreak > nul 

start /b cmd /c temp_cmd.bat

set "fileSize=nul"

:: start of the loop
: loopStart

echo "ping in process. "
timeout /t 2 /nobreak > nul 
cls

echo "ping in process.. "
timeout /t 2 /nobreak > nul 
cls 

echo "ping in process... "
timeout /t 2 /nobreak > nul 
cls


::  check to see if loop should end

if not exist cache.txt (
    type nul > cache.txt
    goto loopStart)
    

for %%A in (cache.txt) do set "fileSize=%%~zA"

if "%fileSize%"=="0" (
    goto loopStart
) else (
    type cache.txt)

pause