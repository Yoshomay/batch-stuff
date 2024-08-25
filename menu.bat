@echo off
cls
:menu

set menuSelection=

Echo What would you like to do?
Echo 1. View the current time
Echo 2. See all the files in a certain folder
Echo 3. Generate a random number
Echo 4. Exit

set /p menuSelection=""

if %menuSelection%==1 (goto time)
if %menuSelection%==2 (goto dir)
if %menuSelection%==3 (goto random)
if %menuSelection%==4 (exit)

    cls
    echo "Please enter a valid number"
    echo.
    goto :menu

:: -------------------------------------------------------

:time
cls
if "%timeFormat%"=="12" (goto time12)
if "%timeFormat%"=="24" (goto time24)

    :asksForTimeFormat
    echo "Would you like the time in 12 hour or 24 hour?"
    set /p timeFormat=
    if "%timeFormat%"=="12" (goto time12)
    if "%timeFormat%"=="24" (goto time24)

    set timeFormat=
    cls
    echo "Please enter either ^"12^" or ^"24^""
    echo.
    goto :asksForTimeFormat

:time12
set "currentTime=%time%"
set "hour=%time:~0,2%"
set "currentTimeMinusHour=%currentTime:~2,-6%" 

if %hour% LSS 12 goto time12am

    set /a hourInt=%hour%
    set /a hourIntPM=%hourInt% - 12
    
    set "currentTimeMinusHour=%currentTime:~2,-6%" 
    cls


    echo The current time is %hourIntPM%%currentTimeMinusHour%PM
    pause

    cls
    goto menu


:time12am

cls
if "%hour%"==" 0" set "hour=12"
echo The current time is %hour%%currentTimeMinusHour%AM
pause

cls
goto menu





:time24
set "currentTime=%time%"
set "currentTime=%currentTime:~0,-6%"

cls
echo The current time is %currentTime% 

pause
cls

goto menu

:: -------------------------------------------------------

:dir
set anotherFolder=""
cls
echo What folder do you want to see?
set /p directory=""

cls
dir /b %directory%
echo.
echo Do you want to see another folder? (y/N)
set /p anotherFolder=""

cls
if "%anotherFolder%"=="Y" goto dir
if "%anotherFolder%"=="y" goto dir
goto menu

:: -------------------------------------------------------

:random
setlocal enabledelayedexpansion 
cls

echo What should the minimum be (default:1)?
:min

set /p min=""

if not defined min (
    set /a "minInt=1"
    goto skiptomax
)

set /a minInt=%min% 2>nul
if errorlevel 1 (
    echo Please enter a valid number ^(0-32767^)
    ver >nul 
    
    set min=""
    set minInt=""
    goto min
)

:skiptomax
echo.
echo What should the maximum be? (default: 100)
:max
set /p max=""

if not defined max (
    set /a "maxInt=100"
    goto randomFinallyDone
)

set /a maxInt=%max% 2>nul
if errorlevel 1 (
    echo Please enter a valid number ^(0-32767^)
    ver >nul
    set max=""
    set maxInt=""
    goto max
)

:randomFinallyDone
set /a result=!random! %% (maxInt - minInt + 1) + minInt

cls
echo %result%
echo.

echo Would you like another random number? (y/N)
set /p anotherRandom=""

cls
if "%anotherRandom%"=="Y" goto randomFinallyDone
if "%anotherRandom%"=="y" goto randomFinallyDone
endlocal
goto menu
::test