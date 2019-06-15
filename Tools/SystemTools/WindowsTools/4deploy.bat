@echo off
CLS
mode con cols=80 lines=20
title 小狼毫重新部署工具

echo 正在尝试自动部署！
echo 请稍等...

if exist "C:\Program Files (x86)\Rime\weasel-0.13.0\WeaselDeployer.exe" (
"C:\Program Files (x86)\Rime\weasel-0.13.0\WeaselDeployer.exe" /deploy
)

if exist "C:\Program Files (x86)\Rime\weasel-0.14.0\WeaselDeployer.exe" (
"C:\Program Files (x86)\Rime\weasel-0.14.0\WeaselDeployer.exe" /deploy
)

cls
echo 部署完成！
echo 更新完成，可以关闭我了

if exist "C:\Program Files (x86)\Rime\weasel-0.13.0\WeaselServer.exe" (
"C:\Program Files (x86)\Rime\weasel-0.13.0\WeaselServer.exe"
)

if exist "C:\Program Files (x86)\Rime\weasel-0.14.0\WeaselServer.exe" (
"C:\Program Files (x86)\Rime\weasel-0.14.0\WeaselServer.exe"
)

exit
