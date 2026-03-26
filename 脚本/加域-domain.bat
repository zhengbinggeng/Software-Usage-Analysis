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
::Zh4grVQjdCaDJNBxCMfTx56DiYFn61eYJ4EgbQI7ahV4nntMBd47d4La07rAJfgWig==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title=加域
color 0e
del /q "C:\host.exe" >nul

:main0
echo 正在检查网络。。。
echo.
ping 10.98.94.5 -n 4 >c:\domain.txt
if  NOT %ERRORLEVEL%==0 echo 请检查网线有没有连接  &goto main0

:main1
cls
:main11
echo.
echo.
echo.
set /p domianname="---请输入域账号(新员工为8位工号)输入正确后请按回车键：" 
if "%domianname%"=="" goto main3


:main2
echo.
echo.
echo         系统正在加域，请勿操作！！！      重启系统后请登录域账户。
netdom join %COMPUTERNAME% /domain:szclou.com /UserD:szclou\yz /PasswordD:szclou##abc123 >null
net localgroup administrators /add szclou\%domianname% >null
if  NOT %ERRORLEVEL%==0 echo "加域失败，请联系IT管理人员"&pause&goto main1
::shutdown -r -t 1
::c:\clera.bat
exit  


:main3
echo.
echo.
echo    你输入值为空，请重新输入...... &goto main1