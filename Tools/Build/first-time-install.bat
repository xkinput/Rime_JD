@echo off
mode con cols=45 lines=20
echo 小狼毫安装引导程序
echo ======================
echo 1、安装小狼毫输入法与小狼毫输入法扩展程序
echo 注意：
echo 一、请不要改动安装地址！
echo 二、请选择稍后重启！
"D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\app\weasel-0.12.0.0-installer.exe"
"D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\app\weasel-expansion-0.9.18.0.exe"
echo .
echo ======================
echo 2、复制码表，并自动部署
CLS

echo 已开始，请稍等...
git pull origin master
echo.
echo 获取最新资料完成
echo.

if exist "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\备份\" (
  del "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\备份\" /S /Q
) else (
  mkdir "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\备份\"
)
xcopy "%APPDATA%\Rime" "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\备份\" /Y /E
cls
echo 备份原有词库		完成

taskkill /f /im WeaselServer.exe
del "%APPDATA%\Rime\" /S /Q
xcopy "rime" "%APPDATA%\Rime\" /Y /E
echo 复制码表文件		完成

rmdir "%APPDATA%\Rime\Windows" /S /Q
echo 删除冗余文件		完成

xcopy "D:\Program Files\Rime_JD\Tools\SystemTools\rime\Windows\*" "%APPDATA%\Rime\" /Y /E
echo 复制独有配置		完成

cls

if exist "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\备份\xkjd6.user.dict.yaml" (
  xcopy "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\备份\xkjd6.user.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo 用户词库还原完成
) else (
  echo 没有用户词库跳过
)
if exist "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\备份\xkjd6.extended.dict.yaml" (
  xcopy "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\备份\xkjd6.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo 扩展配置还原完成
) else (
  echo 没有扩展配置跳过
)
if exist "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\备份\xkjd6dz.extended.dict.yaml" (
  xcopy "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\备份\xkjd6dz.extended.dict.yaml" "%APPDATA%\Rime\" /Y /E
  echo 单字扩展配置还原完成
) else (
  echo 没有单字扩展配置跳过
)
echo 还原用户配置		完成

if exist "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\用户数据\" (
  xcopy "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\用户数据\*" "%APPDATA%\Rime\" /Y /E
  echo 还原用户数据		完成
) else (
  mkdir "D:\Program Files\Rime_JD\Tools\SystemTools\WindowsTools\用户数据\"
)

type D:\Program Files\Rime_JD\Tools\SystemTools\rime\Windows\_*.txt
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