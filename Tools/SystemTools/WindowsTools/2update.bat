@echo off
CLS
mode con cols=80 lines=20
title 小狼毫码表复制工具
:init
setlocal DisableDelayedExpansion
set "batchPath=%~0"
for %%k in (%0) do set batchName=%%~nk
set "vbsGetPrivileges=%temp%\OEgetPriv_%batchName%.vbs"
setlocal EnableDelayedExpansion
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )
:getPrivileges
if '%1'=='ELEV' (echo ELEV & shift /1 & goto gotPrivileges)
ECHO.
ECHO ********************************
ECHO 请求 UAC 权限批准……
ECHO ********************************
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%vbsGetPrivileges%"
ECHO args = "ELEV " >> "%vbsGetPrivileges%"
ECHO For Each strArg in WScript.Arguments >> "%vbsGetPrivileges%"
ECHO args = args ^& strArg ^& " "  >> "%vbsGetPrivileges%"
ECHO Next >> "%vbsGetPrivileges%"
ECHO UAC.ShellExecute "!batchPath!", args, "", "runas", 1 >> "%vbsGetPrivileges%"
"%SystemRoot%\System32\WScript.exe" "%vbsGetPrivileges%" %*
exit /B
:gotPrivileges
setlocal & pushd .
cd /d %~dp0
if '%1'=='ELEV' (del "%vbsGetPrivileges%" 1>nul 2>nul  &  shift /1)

echo 已开始，请稍等...
for %%i in ("../../../rime") do set thisTime1=%%~ti
git pull
for %%i in ("../../../rime") do set thisTime2=%%~ti
if "%thisTime1%"=="%thisTime2%" (
  echo 已是最新了……
  ping -n 6 127.1 >nul
  exit
  pause
)
mkdir "%CD%\备份\"
del "%CD%\备份\" /S /Q
xcopy "%APPDATA%\Rime" "%CD%\备份\" /Y /E
cls
echo 备份原有词库		完成
taskkill /f /im WeaselServer.exe
del "%APPDATA%\Rime\" /S /Q
xcopy "..\..\..\rime" "%APPDATA%\Rime\" /Y /E
echo 复制码表文件		完成
rmdir "%APPDATA%\Rime\Windows" /S /Q
echo 删除冗余文件		完成
xcopy "..\rime\Windows\*" "%APPDATA%\Rime\" /Y /E
echo 复制独有配置		完成
xcopy ".\备份\xkjd6.user.dict.yaml" "%APPDATA%\Rime\" /Y /E
xcopy ".\备份\xkjd6.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
xcopy ".\备份\xkjd6dz.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
echo 还原用户配置		完成
cls
type ..\rime\Windows\_*.txt
echo.
echo.
echo 已安装完成！
echo.
echo 重新部署
start %CD%\4deploy.bat
exit