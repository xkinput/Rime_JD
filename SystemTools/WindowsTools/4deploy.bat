@echo off
CLS
mode con cols=80 lines=20
title 小狼毫重新部署工具

echo 正在尝试自动部署！
echo 请稍等...
"C:\Program Files (x86)\Rime\weasel-0.9.30\WeaselDeployer.exe" /deploy
cls
echo 部署完成！
echo 可以关闭我了
"C:\Program Files (x86)\Rime\weasel-0.9.30\WeaselServer.exe"
exit
