@echo off
chcp 65001 >nul
title 卸载开机自启动

echo ========================================
echo 软件开机自启动卸载工具
echo ========================================
echo.

set "SHORTCUT_NAME=软件自动启动"
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "SHORTCUT_PATH=%STARTUP_FOLDER%\%SHORTCUT_NAME%.lnk"

if not exist "%SHORTCUT_PATH%" (
    echo [提示] 没有找到启动项，可能已经卸载过了
    echo.
    pause
    exit /b 0
)

echo 正在删除启动项...
del "%SHORTCUT_PATH%"

if not exist "%SHORTCUT_PATH%" (
    echo.
    echo ========================================
    echo 卸载成功！
    echo ========================================
    echo.
    echo 启动项已删除，软件不再自动启动
) else (
    echo.
    echo [错误] 卸载失败，请手动删除：%SHORTCUT_PATH%
)

echo.
pause
