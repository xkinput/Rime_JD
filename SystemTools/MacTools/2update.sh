#!/bin/bash
echo "开始备份"
rm -rf 备份/*
# 删除原有备份文件
mkdir 备份
cp -r ~/Library/Rime ./备份/
echo "备份原内容到当前目录下“备份”文件夹.....完成"
echo "==========================================="
rm -rf ~/Library/Rime
echo "清空配置文件目录.......................完成"
cp -r ../../rime ~/Library/Rime
echo "复制Rime用户码表文件...................完成"
cp -r ../rime ~/Library/Rime
echo "复制Rime用户配置文件...................完成"
cp -r ../rime/Mac/* ~/Library/Rime
cp -r ../rime/*.yaml ~/Library/Rime/
echo "复制Rime配置独有文件...................完成"
rm -rf ~/Library/Rime/rime
echo "清除冗余文件...........................完成"
echo "..."
echo "复制所有文件...........................完成"
echo "..."
cp -r ./备份/xkjd6.user.dict.yaml ~/Library/Rime/
echo "还原用户词库...........................完成"
echo "==========================================="
clear
echo "预览 ~/Library/Rime/"
echo "==========================================="
ls ~/Library/Rime/
echo "==========================================="
sleep 1
clear
echo "==========================================="
NAME=../rime/Linux/name.txt
echo "              本文件Rime方案为 "`cat $NAME`" "
echo "已安装完成"
echo "请重新部署后再尝试使用。"
echo "==========================================="
sleep 1
exit
