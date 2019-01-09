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

echo 本机git版本为：
git --version
echo.

if %ERRORLEVEL% EQU 0 (
  echo 获取最新码表：
  git pull origin master
  echo 获取最新码表完成
) else (
  cls
  echo.
  echo 未安装git程序，请安装git程序！
  ping -n 3 127.1 >nul
  echo.
  echo 十秒后自动退出...
  ping -n 10 127.1 >nul
  exit
)
echo.
echo 3秒后开始更新，Ctrl + C停止……
ping -n 3 127.1 >nul

if exist "%CD%\备份\" (
  del "%CD%\备份\" /S /Q
) else (
  mkdir "%CD%\备份\"
)
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

cls

if exist ".\备份\xkjd6.user.dict.yaml" (
  xcopy ".\备份\xkjd6.user.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo 用户词库还原完成
) else (
  echo 没有用户词库跳过
)
if exist ".\备份\xkjd6.extended.dict.yaml" (
  xcopy ".\备份\xkjd6.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo 扩展配置还原完成
) else (
  echo 没有扩展配置跳过
)
if exist ".\备份\xkjd6dz.extended.dict.yaml" (
  xcopy ".\备份\xkjd6dz.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo 单字扩展配置还原完成
) else (
  echo 没有单字扩展配置跳过
)
echo 还原用户配置		完成

if exist "%CD%\用户数据\" (
  xcopy ".\用户数据\*" "%APPDATA%\Rime\" /Y /E
  xcopy ".\用户数据\preview\*" "C:\Program Files (x86)\Rime\weasel-0.12.0\data\preview\" /Y /E
  echo 还原用户数据		完成
) else (
  mkdir "%CD%\用户数据\"
)

type ..\rime\Windows\_*.txt
echo.
echo.

echo 已安装完成！
echo.
echo 重新部署
"%CD%\4deploy.bat"
exit