@echo off 

echo whats ur first num
set /p one=
set /A oneConverted = %one%

echo whats ur second num
set /p two=
set /A twoConverted = %two%

set /A sum=%oneConverted%+%twoConverted%
echo.
echo Your sum is: %sum%
pause