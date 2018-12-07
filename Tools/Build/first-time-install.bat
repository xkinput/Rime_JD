@echo off
mode con cols=45 lines=20
echo 小狼毫安装引导程序
echo ======================
echo 1、安装小狼毫输入法与小狼毫输入法扩展程序
echo 注意：
echo 一、请不要改动安装地址！
echo 二、请选择稍后重启！
"Tools\SystemTools\WindowsTools\app\weasel-0.12.0.0-installer.exe"
"Tools\SystemTools\WindowsTools\app\weasel-expansion-0.9.18.0.exe"
echo .
echo ======================
echo 2、复制码表，并自动部署
CLS

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
  echo 未安装git程序，将安装git程序。
  "Tools\Build\Git-2.19.2-64-bit.exe"
  echo 获取最新码表：
  git pull origin master
  echo 获取最新码表完成
)
echo.
echo 获取最新资料完成
echo.

if exist "Tools\SystemTools\WindowsTools\备份\" (
  del "Tools\SystemTools\WindowsTools\备份\" /S /Q
) else (
  mkdir "Tools\SystemTools\WindowsTools\备份\"
)
xcopy "%APPDATA%\Rime" "Tools\SystemTools\WindowsTools\备份\" /Y /E
cls
echo 备份原有词库		完成

taskkill /f /im WeaselServer.exe
del "%APPDATA%\Rime\" /S /Q
xcopy "rime" "%APPDATA%\Rime\" /Y /E
echo 复制码表文件		完成

rmdir "%APPDATA%\Rime\Windows" /S /Q
echo 删除冗余文件		完成

xcopy "Tools\SystemTools\rime\Windows\*" "%APPDATA%\Rime\" /Y /E
echo 复制独有配置		完成

cls

if exist "Tools\SystemTools\WindowsTools\备份\xkjd6.user.dict.yaml" (
  xcopy "Tools\SystemTools\WindowsTools\备份\xkjd6.user.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo 用户词库还原完成
) else (
  echo 没有用户词库跳过
)
if exist "Tools\SystemTools\WindowsTools\备份\xkjd6.extended.dict.yaml" (
  xcopy "Tools\SystemTools\WindowsTools\备份\xkjd6.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo 扩展配置还原完成
) else (
  echo 没有扩展配置跳过
)
if exist "Tools\SystemTools\WindowsTools\备份\xkjd6dz.extended.dict.yaml" (
  xcopy "Tools\SystemTools\WindowsTools\备份\xkjd6dz.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo 单字扩展配置还原完成
) else (
  echo 没有单字扩展配置跳过
)
echo 还原用户配置		完成

if exist "Tools\SystemTools\WindowsTools\用户数据\" (
  xcopy "Tools\SystemTools\WindowsTools\用户数据\*" "%APPDATA%\Rime\" /Y /E
  xcopy "Tools\SystemTools\WindowsTools\用户数据\preview\*" "C:\Program Files (x86)\Rime\weasel-0.12.0\data\preview\" /Y /E
  echo 还原用户数据		完成
) else (
  mkdir "Tools\SystemTools\WindowsTools\用户数据\"
)

type "Tools\SystemTools\rime\Windows\_*.txt"
echo.
echo.

echo 已安装完成！
echo.
echo 重新部署
title 小狼毫重新部署工具
cls
echo 正在尝试自动部署！
echo 请稍等...
"C:\Program Files (x86)\Rime\weasel-0.12.0\WeaselDeployer.exe" /deploy
cls
echo 部署完成！
echo 可以关闭我了，安装完成
"C:\Program Files (x86)\Rime\weasel-0.12.0\WeaselServer.exe"
exit