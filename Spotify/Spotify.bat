@ECHO OFF
:B
TASKLIST | FINDSTR /I "Spotify.exe"
IF ERRORLEVEL 1 (GOTO :B) Else (GOTO :C)
GOTO :B

:C
TASKLIST | FINDSTR /I "Toastify.exe"
IF ERRORLEVEL 1 (CALL "C:\Program Files\Toastify\Toastify.exe") ELSE (GOTO :B)
GOTO :B