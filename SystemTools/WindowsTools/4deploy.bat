@echo off
CLS
mode con cols=80 lines=20
title 小狼毫重新部署工具

echo 正在尝试自动部署！
echo 请稍等...
"C:\Program Files (x86)\Rime\weasel-0.9.30\WeaselDeployer.exe" /deploy
cls
echo 部署完成！
"C:\Program Files (x86)\Rime\weasel-0.9.30\WeaselServer.exe" /deploy
echo.
echo ============================
echo 请切换输入法到小狼毫（不是TSF版，可手动删除TSF版本选项）
echo.
echo 并尝试在已打开记事本尝试输入
echo.
echo 简言之，打出字便成功
echo.
echo 关闭记事本后继续...
notepad
echo ============================
echo 若需，请双击打开用户文件夹检查文件
pause
exit
