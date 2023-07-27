::made by Mogaly | t.me/unwaits

:retry
@echo off
chcp 65001>nul
del %temp%\mclogs.txt /q /f
cls
title Minecraft Name Checker
mode 89,22
echo.
echo  [40;32m█▀▄▀█ █ █▄ █ █▀▀ █▀▀ █▀█ ▄▀█ █▀▀ ▀█▀   █▄ █ ▄▀█ █▀▄▀█ █▀▀   █▀▀ █ █ █▀▀ █▀▀ █▄▀ █▀▀ █▀█
echo  [40;32m█ ▀ █ █ █ ▀█ ██▄ █▄▄ █▀▄ █▀█ █▀   █    █ ▀█ █▀█ █ ▀ █ ██▄   █▄▄ █▀█ ██▄ █▄▄ █ █ ██▄ █▀▄
echo.
echo                        [40;37mDrag the combo file (.txt) to the console
echo.
set /p combo="[40;30m.[40;33m[?] [40;37mPath: "
if not exist %combo% echo  [40;31m[-] [40;37mFile not found &pause>nul & goto retry
echo  [40;32m[+] [40;37mCombo loaded
set /p namemc="[40;30m.[40;33m[?] [40;37mOpen NameMC? (Y/N): "
echo  [40;32m[+] [40;37mStarting
echo.
for /F "usebackq tokens=*" %%M in ("%combo%") do (
curl -s https://api.mojang.com/users/profiles/minecraft/%%M>%temp%\mclogs.txt
find /i "name" %temp%\mclogs.txt >nul
if errorlevel 1 (
if %namemc%==Y start https://namemc.com/search?q=%%M
call :ColorText 0C "[+] %%M"
echo  [40;32m[+] %%M
echo %%M>>hits.txt
) else (
echo  [40;31m[-] %%M
del %temp%\mclogs.txt /q /f )
)
echo.
echo  [40;37mValid names have been saved in [40;32mhits.txt
pause>nul
exit
:ColorText
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
