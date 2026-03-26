@echo off
chcp 65001 >nul
title 安装开机自启动

echo ========================================
echo 软件开机自启动安装工具
echo ========================================
echo.

set "SCRIPT_DIR=%~dp0"
set "START_SCRIPT=%SCRIPT_DIR%start_software.bat"
set "SHORTCUT_NAME=软件自动启动"
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

if not exist "%START_SCRIPT%" (
    echo [错误] 找不到启动脚本：%START_SCRIPT%
    echo.
    pause
    exit /b 1
)

echo [1/3] 创建快捷方式...
powershell -Command "$WshShell = New-Object -ComObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%STARTUP_FOLDER%\%SHORTCUT_NAME%.lnk'); $Shortcut.TargetPath = '%START_SCRIPT%'; $Shortcut.WorkingDirectory = '%SCRIPT_DIR%'; $Shortcut.Save()"

if exist "%STARTUP_FOLDER%\%SHORTCUT_NAME%.lnk" (
    echo [成功] 快捷方式已创建
) else (
    echo [失败] 快捷方式创建失败
    echo.
    pause
    exit /b 1
)

echo.
echo [2/3] 验证启动项...
echo 启动项位置：%STARTUP_FOLDER%\%SHORTCUT_NAME%.lnk
echo.

echo [3/3] 完成！
echo.
echo ========================================
echo 安装成功！
echo ========================================
echo.
echo 下次系统启动时，软件将自动运行
echo.
echo 如需卸载，请运行 uninstall_autostart.bat
echo.
pause
