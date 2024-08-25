@echo off
cls
set num=0

timeout /t 1 /nobreak >nul
:startOfTheLoop
set /a num+=1
echo %num%
timeout /t 1 /nobreak >nul
goto startOfTheLoop

exit
pause
::fix