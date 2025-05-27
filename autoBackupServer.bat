@echo off
echo snowy is a dummie

REM Store the date in a temporary variable
set dt=%DATE%

REM If the date starts with a letter (day-of-week), remove the first 4 characters (e.g., "Mon ")
if "%dt:~0,1%" GEQ "A" if "%dt:~0,1%" LEQ "Z" (
    set dt=%dt:~4%
)

REM Tokenize the date by "/" to get month, day (ignoring the year)
for /f "tokens=1-3 delims=/" %%a in ("%dt%") do (
    set MM=%%a
    set DD=%%b
)

REM Use arithmetic to remove any leading zeros:
set /a MM=1%MM%-100
set /a DD=1%DD%-100

REM Create the variable in the format M.D (e.g., 3.18)

set currentDate=%MM%.%DD%.25



if exist D:\backups\superflat\backups\%currentDate% (
    set currentDate=%currentDate%.1
)
if exist D:\backups\superflat\backups\%currentDate% (
    cls
    echo there's too many backups going on just do it manually im too lazy to do this lol
    pause
    exit
)

mkdir D:\backups\superflat\backups\%currentDate%
mkdir D:\backups\superflat\backups\%currentDate%\world
mkdir D:\backups\superflat\backups\%currentDate%\world_nether
mkdir D:\backups\superflat\backups\%currentDate%\world_the_end

::xcopy /E /I world        D:\backups\superflat\backups\%currentDate%
::xcopy /E /I world_nether D:\backups\superflat\backups\%currentDate%
::xcopy /E /I world_the_end    test_backups\%currentDate%

@robocopy "world"        "D:\backups\superflat\backups\%currentDate%\world" /E
@robocopy "world_nether" "D:\backups\superflat\backups\%currentDate%\world_nether" /E
@robocopy "world_the_end"    "D:\backups\superflat\backups\%currentDate%\world_the_end" /E

echo it should be all good now :boop:
pause