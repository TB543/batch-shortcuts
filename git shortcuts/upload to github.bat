@echo off
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion
set /p dir="enter folder path (WARNING if enterd incorrectly, a repository will be created for this directory): "
cd %dir%
echo:
git init
echo:
git add .
echo:
git status
echo:
git commit -m "first commit"
echo:
echo !ESC![92mRepository Created/Updated!ESC![0m
echo:
pause
cls
set /p url="enter URL (if enterd incorrectly, nothing will happen): "
echo:
git remote add origin %url%
echo:
git branch -M main
echo:
git push --force -u origin main
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