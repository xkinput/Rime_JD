#!/bin/sh
echo "开始备份"
rm -rf 备份/*
# 删除原有备份文件
mkdir 备份
cp -r ~/Library/Rime ./备份/
echo "备份原内容到当前目录下“备份”文件夹完成"
echo "==========================================="
rm -rf ~/Library/Rime
echo "清空配置文件目录完成"
cp -r ../../rime ~/Library/Rime
echo "复制Rime用户码表文件完成"
cp -r ../rime ~/Library/Rime
echo "复制Rime用户配置文件完成"
cp -r ../rime/Mac/* ~/Library/Rime
cp -r ../rime/*.yaml ~/Library/Rime/
echo "复制Rime配置独有文件完成"
# rm -rf ~/Library/Rime/Windows
# rm -rf ~/Library/Rime/Mac
rm -rf ~/Library/Rime/rime
echo "清除冗余文件完成"
echo "..."
echo "....."
clear
echo "已复制文件所有完成"
echo "==========================================="
clear
echo "预览 ~/Library/Rime/"
echo "==========================================="
ls ~/Library/Rime/
echo "==========================================="
sleep 1
clear
echo "==========================================="
NAME=../rime/LinuxTools/name.txt
echo "              本文件Rime方案为 "`cat $NAME`" "
echo "已完成安装"
echo "请重新部署后再尝试使用。"
echo "==========================================="
sleep 1
exit
