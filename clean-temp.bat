@echo off
title Temp Cleaner - Tyson 2026
color 0A
cls

echo.
echo ============================================
echo   Temp Cleaner Tool
echo   Tyson 2026
echo   Discord: t.y.s.o.n1
echo ============================================
echo.

REM تشغيل الأغنية بدون فتح برنامج
powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.Reflection.Assembly]::LoadWithPartialName('presentationCore') | Out-Null; $player = New-Object System.Windows.Media.MediaPlayer; $player.Open([uri]'%~dp0music.mp3'); $player.Play(); Start-Sleep -Seconds 100"

:menu
echo.
echo [1] Clean Temp Files
echo [2] Exit
echo.
set /p choice="Enter choice (1 or 2): "

if "%choice%"=="1" goto clean
if "%choice%"=="2" goto exit
echo Invalid choice!
timeout /t 1 >nul
cls
goto menu

:clean
cls
echo Cleaning temporary files...
echo.

for /d %%X in (%TEMP%\*) do @rd /s /q "%%X" 2>nul
del /q /f /s %TEMP%\*.* 2>nul

for /d %%X in (%USERPROFILE%\AppData\Local\Temp\*) do @rd /s /q "%%X" 2>nul
del /q /f /s %USERPROFILE%\AppData\Local\Temp\*.* 2>nul

echo.
echo Done! Press any key to return to menu...
pause >nul
cls
goto menu

:exit
cls
echo Thank you for using Temp Cleaner!
echo.
timeout /t 2 >nul
exit
