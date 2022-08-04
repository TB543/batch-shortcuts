@echo off
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion
set /p dir="enter folder path (WARNING if enterd incorrectly, a repository will be created for this directory): "
echo:
set /p url="enter heroku project name (if enterd incorrectly, nothing will happen): "
cd %dir%
echo:
git init
echo:
start cmd /c heroku git:remote -a %url%
timeout /t 3
echo:
git add .
echo:
git status
echo:
git commit
echo:
echo !ESC![92mRepository Created/Updated!ESC![0m
echo:
git push --force heroku main
echo:
echo !ESC![92mDone!ESC![0m
echo:
pause
cls
:C
set /p remove="Remove Repository (Y/N): "
if %remove%==y goto A
if %remove%==n goto B
cls
echo !ESC![91mEnter A Valid Response!ESC![0m
goto C
:A
rmdir /s /q .git
echo !ESC![92mDone!ESC![0m
echo:
pause
:B