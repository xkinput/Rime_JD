@echo off
mode con cols=45 lines=20
echo 小狼毫安装引导程序
echo ======================
echo 1、安装小狼毫输入法
echo 注意：请不要改动安装地址，程序会在后期调用自动部署，改动则会失败
app\weasel-0.9.30.0-installer.exe
echo 2、安装小狼毫输入法扩展程序
echo 注意：请不要改动安装地址，程序会在后期调用自动部署，改动则会失败
app\weasel-expansion-0.9.18.0.exe
echo .
echo ======================
echo 3、复制码表，并自动部署
start 2update.bat
exit