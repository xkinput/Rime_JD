echo "开始备份"
rm -rf 备份/*
# 删除原有备份文件
mkdir 备份
cp -r ~/.config/fcitx/rime ./备份/
echo "备份原内容到当前目录下“备份”文件夹完成"
echo "==========================================="
rm -rf ~/.config/fcitx/rime
echo "清空配置文件目录完成"
cp -r ../../rime ~/.config/fcitx
echo "复制Rime用户码表文件完成"
cp -r ../rime ~/.config/fcitx
echo "复制Rime用户配置文件完成"
cp -r ../rime/Linux/* ~/.config/fcitx/rime/
echo "复制Linux Rime配置独有文件完成"
rm -rf ~/.config/fcitx/rime/Windows
rm -rf ~/.config/fcitx/rime/Mac
echo "清楚冗余文件完成"
echo "..."
echo "....."
clear
echo "已复制文件所有完成"
echo "==========================================="
clear
echo "预览 ~/.config/fcitx/rime/"
echo "==========================================="
ls ~/.config/fcitx/rime/
echo "==========================================="
sleep 1
clear
echo "==========================================="
NAME=../rime/Linux/name.txt
echo "              本文件Rime方案为 "`cat $NAME`" "
echo "已完成安装"
echo "请在fcitx重新部署后再尝试使用。"
echo "==========================================="
sleep 1
exit
