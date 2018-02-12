echo "开始备份"
rm -rf 备份/*
# 删除原有备份文件
mkdir 备份
cp -r ~/.config/fcitx/rime ./备份/
echo "备份“用户文件夹”到“备份”文件夹	完成"
echo "==========================================="
rm -rf ~/.config/fcitx/rime
echo "清空配置文件目录					完成"
cp -r ../../rime ~/.config/fcitx
echo "复制Rime用户码表文件				完成"
cp -r ../rime/*.yaml ~/.config/fcitx
echo "复制Rime用户配置文件				完成"
cp -r ./备份/xkjd6.user.dict.yaml ~/.config/fcitx/rime/
echo "还原用户词库						完成"
echo "..."
echo "复制所有文件						完成"
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
