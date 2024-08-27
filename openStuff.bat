@echo off
cls
echo What do you want to open (if it's not in C\Windows\ or C\Windows\System32, you'll have to provide the exact path)
echo Enter nothing to open notepad
set /p whatToOpen=""
if "%whatToOpen%"=="" set whatToOpen=notepad.exe

cls
echo How many times should it open?
echo Enter nothing to have it open 10 times
echo WARNING, if the number is too high it could cause issues
set /p howManyTimes="" 
if "%howManyTimes%"=="" set howManyTimes=10

set /a howManyTimes="%howManyTimes%"


cls
set /a count=0
:start
start %whatToOpen%
set /a count+=1

if not %count%==%howManyTimes% goto start