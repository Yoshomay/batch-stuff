@echo off
:startOfFile
cls

echo               -----------------------------------------------------------
echo               ^|           Random Number Guesser by Yoshomay.            ^|
echo               ^| To play, type the number between 1-10, then press enter ^|
echo               ^|                   Press enter to play                   ^|
echo               -----------------------------------------------------------

set /p a=""

:startOfQuiz
set /a score=0

:start
cls
set /a result=%random%*10/32768+1

echo Your current score is %score%
set /p answer="What is your guess? "

echo.

if "%answer%"=="%result%" (
    set /a score=score+1
    echo Correct!
) else (
    echo Incorrect! The correct answer was %result%
)

echo To go to the final screen, enter "x", enter anything else to try again.
set tryAgain=""
set /p tryAgain=""

if "%tryAgain%"=="x" (
    goto finalScreen)
goto start


:finalScreen
cls

echo Your final score is %score%
echo.
echo To go to the title screen, enter "1"
echo To continue guessing, enter "2"
echo To exit, enter "3"

set /p finalDecision=""

if "%finalDecision%"=="1" goto :startOfFile
if "%finalDecision%"=="2" goto :start
if "%finalDecision%"=="3" (
    exit) else (
    goto :finalScreen
)