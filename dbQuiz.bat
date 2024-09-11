@echo off
setlocal
:mainMenu
cls

echo --------------------------------------------------------------------------------------------------
echo ^| Dragon Ball quiz by Yoshomay. To answer the questions type ^"1^" ^"2^" ^"3^" or ^"4^", then press enter^|
echo ^| There are 10 questions in total                                                                ^|
echo --------------------------------------------------------------------------------------------------

set /p a=""


:startOfTheQuiz
set /a score="0"
cls


call :question 1, "Who is Vegeta's brother?", "Gure", "Tarble", "Paragus", "Turles", 2
call :question 2, "Who voiced Goku in the Ocean dub?", "Peter Kelamis", "Sean Schemmel", "Brian Drummond ", "Christopher Sabat", 1
call :question 3, "When did the first Dragon Ball Fortnite colab release?", "Chapter 3 Season 4", "Chapter 4 Season 1", "Chapter 3 Season 2", "Chapter 3 Season 3", 4
call :question 4, "What was the theme song used in the orignal English Dragon Ball Z dub?", "Rock the Dragon", "Cha-La Head Cha-La", "Gotta Find That Dragon Ball", "Mystical Adventure", 1
call :question 5, "How many times *in the main cannon timeline* has Krillin died?", "1", "2", "3", "4", 3
call :question 6, "What universe is Giren from?", "9", "11", "7", "2", 3
call :question 7, "Who is the angel of universe 6", "Martinu", "Whis", "Shin", "Vados", 4
call :question 8, "Who has not died in the *main cannon timeline*? (excluding Super Buu)", "Goku", "Krillin", "Gohan", "Picolo" 3
call :question 9, "What movie came right after Bio Broley?", "Fusion Reborn", "Broley Second Coming", "Wrath of the Dragon", "Bojack Unbound", 1
call :question 10, "'Dragon Ball Minus' is from what manga?" "Dr. Slump", "Jaco the Galactic Patrolman", "Dragon Ball Super", "Cowa", 2


:finalMenu
cls
echo Your score is %score%/10
echo.
echo To try again, enter ^"1^"
echo To see the answers, enter ^"2^"
echo To go to my personal website, enter ^"3^"
echo To speak to customer service, enter ^"4^"
echo To exit enter anything else
set playAgain=""
set /p playAgain=""

if "%playAgain%"=="1" goto :startOfTheQuiz
if "%playAgain%"=="2" goto :answers
if "%playAgain%"=="3" start "" "https://yoshomay.epizy.com/" && goto :finalMenu
if "%playAgain%"=="4" start "" "https://yoshomay.epizy.com/stuffforvideos/how_may_i_take_your_order.png" && goto :finalMenu

exit

:answers
cls
echo 1. Who is Vegeta's brother?: Tarble
echo 2. Who voiced Goku in the Ocean dub?: Peter Kelamis
echo 3. When did the first Dragon Ball Fortnite colab release?: Chapter 3 season 3
echo 4. What was the theme song used in the orignal English Dragon Ball Z dub?: Rock the Dragon
echo 5. How many times *in the main cannon timeline* has Krillin died?: 3
echo 6. What universe is Giren from?: 7
echo 7. Who is the angel of universe 6?: Vados
echo 8. Who has not died in the *main cannon timeline*? (excluding Super Buu): Gohan
echo 9. What movie came right after Bio Broley?: Fusion Reborn
echo 10. 'Dragon Ball Minus' is from what manga?: Jaco the Galactic Patrolman
echo.

pause
goto finalMenu



:question

cls
echo Question %~1:
echo %~2
echo.
echo 1: %~3
echo 2: %~4
echo 3: %~5
echo 4: %~6
::echo.
set /p userInput=""

if not "%userInput%"=="1" if not "%userInput%"=="2" if not "%userInput%"=="3" if not "%userInput%"=="4" (
    cls
    echo "Please enter 1, 2, 3, or 4"
    pause
    echo.
    goto :question
)

set /a userInputInt=%userInput%
if "%userInput%"=="%~7" (
    set /a score+=1
    echo.
    echo Correct!
    timeout /t 1 /nobreak >nul
    exit /b 0
)

echo.
echo Incorrect!
timeout /t 2 /nobreak >nul
exit /b 0

echo how the hell u reading this
pause