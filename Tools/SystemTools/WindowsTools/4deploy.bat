@echo off
CLS
mode con cols=80 lines=20
title С�Ǻ����²��𹤾�

echo ���ڳ����Զ�����
echo ���Ե�...
"C:\Program Files (x86)\Rime\weasel-0.11.1\WeaselDeployer.exe" /deploy
cls
echo ������ɣ�
echo ���Թر�����
"C:\Program Files (x86)\Rime\weasel-0.11.1\WeaselServer.exe"
exit