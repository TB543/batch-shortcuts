@echo off
cd C:\Users\tbarr\Downloads
:a
set /a num=1
:b
set /a num=%num%+1
for %%f in (*.zip) do (
    if exist "%%~nf"\ (
        if exist "%%~nf (%num%)"\ (
            goto b
        ) else (
            mkdir "%%~nf (%num%)"\
            powershell -Command "Expand-Archive '%%f' -DestinationPath 'C:\Users\tbarr\Downloads\%%~nf (%num%)'"
            del "%%f"
            goto a
        )
    ) else (
        mkdir "%%~nf"
        powershell -Command "Expand-Archive '%%f' -DestinationPath 'C:\Users\tbarr\Downloads\%%~nf'"
        del "%%f"
        goto a
    )
)
timeout /T 1 /nobreak
goto a