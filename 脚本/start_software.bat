@echo off
chcp 65001 >nul
title 软件启动脚本

echo ========================================
echo 正在启动软件主进程...
echo ========================================
echo.

set SOFTWARE_PATH=C:\Program Files (x86)\ManageEngine\UEMS_Agent\bin
set SOFTWARE_EXE=dcagenttrayicon.exe

if "%SOFTWARE_PATH%"=="" (
    echo [错误] 请先编辑此脚本，设置 SOFTWARE_PATH 和 SOFTWARE_EXE 变量！
    echo.
    echo 示例：
    echo set SOFTWARE_PATH=C:\Program Files\YourSoftware
    echo set SOFTWARE_EXE=YourSoftware.exe
    echo.
    pause
    exit /b 1
)

if not exist "%SOFTWARE_PATH%\%SOFTWARE_EXE%" (
    echo [错误] 找不到程序文件：%SOFTWARE_PATH%\%SOFTWARE_EXE%
    echo.
    pause
    exit /b 1
)

echo 程序路径：%SOFTWARE_PATH%\%SOFTWARE_EXE%
echo.
echo 正在启动...

cd /d "%SOFTWARE_PATH%"
start "" "%SOFTWARE_EXE%"

if %errorlevel% equ 0 (
    echo.
    echo [成功] 软件启动成功！
) else (
    echo.
    echo [警告] 软件可能已在运行或启动失败
)

timeout /t 3 >nul
