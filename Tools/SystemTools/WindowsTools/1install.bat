@echo off
mode con cols=45 lines=20
echo 小狼毫安装引导程序
echo ======================
echo 1、安装小狼毫输入法与小狼毫输入法扩展程序
echo 注意：
echo 一、请不要改动安装地址！
echo 二、请选择稍后重启！
"%CD%\app\weasel-0.14.0.135-installer.exe"
"%CD%\app\weasel-expansion-0.9.18.0.exe"
echo .
echo ======================
echo 2、复制码表，并自动部署
"%CD%\2update.bat"
exit