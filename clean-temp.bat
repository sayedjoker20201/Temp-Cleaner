@echo off
chcp 65001 >nul
title Temp Cleaner - Tyson 2026
color 0A
cls

REM ==========================================
REM  Temp Cleaner Tool
REM  Copyright: Tyson
REM  Year: 2026
REM  Discord: t.y.s.o.n1
REM ==========================================

REM تشغيل اغنية عند فتح البرنامج (اختياري)
REM قم بحفظ ملف صوتي باسم music.mp3 في نفس مجلد الـ bat
if exist "%~dp0music.mp3" (
    start "" "%~dp0music.mp3"
)

echo.
echo ============================================
echo  ^> Temp Cleaner Tool ^<
echo  Copyright: Tyson
echo  Year: 2026
echo  Discord: t.y.s.o.n1
echo ============================================
echo.
echo اختر من الخيارات:
echo.
echo [1] مسح الملفات المؤقتة
echo [2] غلق البرنامج
echo.

set /p choice="ادخل اختيارك (1 او 2): "

if "%choice%"=="1" (
    call :CleanTemp
    echo.
    echo اضغط اي زر للمتابعة...
    pause >nul
    cls
    goto menu
) else if "%choice%"=="2" (
    echo.
    echo شكرا لاستخدام البرنامج!
    echo.
    timeout /t 2 >nul
    exit /b
) else (
    cls
    echo اختيار خاطئ! اكتب 1 أو 2 فقط.
    echo.
    timeout /t 2 >nul
    cls
    goto menu
)

:menu
goto start

:start
echo.
echo ============================================
echo  ^> Temp Cleaner Tool ^<
echo  Copyright: Tyson
echo  Year: 2026
echo  Discord: t.y.s.o.n1
echo ============================================
echo.
echo اختر من الخيارات:
echo.
echo [1] مسح الملفات المؤقتة
echo [2] غلق البرنامج
echo.

set /p choice="ادخل اختيارك (1 او 2): "

if "%choice%"=="1" (
    call :CleanTemp
    echo.
    echo اضغط اي زر للمتابعة...
    pause >nul
    cls
    goto start
) else if "%choice%"=="2" (
    echo.
    echo شكرا لاستخدام البرنامج!
    echo.
    timeout /t 2 >nul
    exit /b
) else (
    cls
    echo اختيار خاطئ! اكتب 1 أو 2 فقط.
    echo.
    timeout /t 2 >nul
    cls
    goto start
)

:CleanTemp
cls
echo.
echo ============================================
echo  جاري مسح الملفات المؤقتة...
echo ============================================
echo.

taskkill /f /im explorer.exe >nul 2>&1

echo [1/8] تنظيف %TEMP%
attrib -r -a -s -h "%TEMP%\*.*" /s /d >nul 2>&1
del /f /s /q "%TEMP%\*.*" >nul 2>&1
for /d %%D in ("%TEMP%\*") do rd /s /q "%%D" >nul 2>&1
echo ✓ تم

echo.
echo [2/8] تنظيف AppData Temp
attrib -r -a -s -h "%USERPROFILE%\AppData\Local\Temp\*.*" /s /d >nul 2>&1
del /f /s /q "%USERPROFILE%\AppData\Local\Temp\*.*" >nul 2>&1
for /d %%D in ("%USERPROFILE%\AppData\Local\Temp\*") do rd /s /q "%%D" >nul 2>&1
echo ✓ تم

echo.
echo [3/8] تنظيف INetCache
attrib -r -a -s -h "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*.*" /s /d >nul 2>&1
del /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*.*" >nul 2>&1
for /d %%D in ("%USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache\*") do rd /s /q "%%D" >nul 2>&1
echo ✓ تم

echo.
echo [4/8] تنظيف Temporary Internet Files
attrib -r -a -s -h "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*" /s /d >nul 2>&1
del /f /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*" >nul 2>&1
for /d %%D in ("%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*") do rd /s /q "%%D" >nul 2>&1
echo ✓ تم

echo.
echo [5/8] تنظيف Windows Temp
attrib -r -a -s -h "%SystemRoot%\Temp\*.*" /s /d >nul 2>&1
del /f /s /q "%SystemRoot%\Temp\*.*" >nul 2>&1
for /d %%D in ("%SystemRoot%\Temp\*") do rd /s /q "%%D" >nul 2>&1
echo ✓ تم

echo.
echo [6/8] تنظيف LocalService Temp
attrib -r -a -s -h "%SystemRoot%\ServiceProfiles\LocalService\AppData\Local\Temp\*.*" /s /d >nul 2>&1
del /f /s /q "%SystemRoot%\ServiceProfiles\LocalService\AppData\Local\Temp\*.*" >nul 2>&1
for /d %%D in ("%SystemRoot%\ServiceProfiles\LocalService\AppData\Local\Temp\*") do rd /s /q "%%D" >nul 2>&1
echo ✓ تم

echo.
echo [7/8] تنظيف NetworkService Temp
attrib -r -a -s -h "%SystemRoot%\ServiceProfiles\NetworkService\AppData\Local\Temp\*.*" /s /d >nul 2>&1
del /f /s /q "%SystemRoot%\ServiceProfiles\NetworkService\AppData\Local\Temp\*.*" >nul 2>&1
for /d %%D in ("%SystemRoot%\ServiceProfiles\NetworkService\AppData\Local\Temp\*") do rd /s /q "%%D" >nul 2>&1
echo ✓ تم

echo.
echo [8/8] إعادة تشغيل Explorer
start explorer.exe
timeout /t 2 >nul
echo ✓ تم

echo.
echo ============================================
echo  تم مسح الملفات المؤقتة بنجاح!
echo ============================================
echo.

exit /b
