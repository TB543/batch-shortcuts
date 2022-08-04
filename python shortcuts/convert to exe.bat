@echo off
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion
set /p dir="enter directory path (WARNING if enterd incorrectly, nothing will happen): "
set /p file="enter file name (WARNING if entered incorrectly, nothing will happen): "
cd %dir%
pip install --upgrade pip
pip install pyinstaller
pyinstaller --onefile -w %file%
move main.spec build
move dist\main.exe
rmdir /s /q build
rmdir /s /q dist
rmdir /s /q __pycache__
echo:
echo !ESC![92mDone!ESC![0m
echo:
pause