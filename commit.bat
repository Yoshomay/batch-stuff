@echo off
: adds the changed files
git add *

: ask what
set /p commitChanges=what changed?: 

: says whats changed
if "%commitChanges%" == "" (
    git commit -m "cant be bothered to enter what"
)   else ( 
        git commit -m "%commitChanges%"
)

: pushes them to the repo
git push

echo.

echo its updated
pause