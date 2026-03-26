::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCmDJG6B+m45FJ6vkoNr21ezCbYg7eno9uOErUMiBrJtKN+OiOLeebVAvhG8JsR+6i4KyZ1bQhJbcXI=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCaDJNBxCMfTx56DiYFn61eYJ4EgbQI7ahV4nntMBd43d5zPlLGWJYA=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title=修改计算机名
color 0e
echo.
echo.
echo.


:main1
echo.
echo.
set /p pcname="---请输入主机资产编号(主机箱贴的白色纸标签有注明)输入正确后请按回车键：" 
if "%pcname%"=="" goto main3
if %pcname:~0,1% neq "L" set "pcname=L%pcname%"

:main2
echo.
echo.
echo 若杀毒软件拦截，请选择“允许所有操作”
set regpth1=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ComputerName\ComputerName
set regpth2=HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
set regpth3=HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\ComputerName\ActiveComputerName
reg add %regpth1% /v ComputerName /d %pcname% /f>nul
reg add %regpth2% /v "NV Hostname" /d %pcname% /f>nul
reg add %regpth2% /v Hostname /d %pcname% /f>nul
reg add %regpth3% /v ComputerName /d %pcname% /f>nul
::reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v winrar /t reg_sz /d "c:\domain.exe" /f
::shutdown -r -t 1
exit

:main3
echo.
echo.
echo    你输入值为空，请重新输入...... &goto main1