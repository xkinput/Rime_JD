clear

JDL=""
YB=""
LB=""
fcitx=~/.config/fcitx
rime=~/.config/fcitx/rime
if [ ! -d "./备份" ]; then
	clear
	mkdir 备份
else
	rm -rf 备份/*
fi

if [ ! -f "$rime/default.yaml" ]; then
	echo "无需备份"
else
	cp -rf "$rime"/* ./备份/
	echo "备份“用户文件夹”到“备份”文件夹	完成"
fi
sleep 1
rm -rf "$rime"
echo "清空配置文件目录					完成"
clear
echo "检测到键道6词库，是否同时安装？ y/n"
read isInstall
if [ "$isInstall" = "y" ] || [ "$isInstall" = "Y" ]; then
	cp -rf ../../rime "$fcitx"
	echo "复制Rime用户码表文件				完成"
	cp -rf ../rime/*.yaml "$rime"
	echo "复制Rime用户配置文件				完成"
	echo "复制所有文件					完成"
	JDL="键道6"
else
	echo "已拒绝安装。"
fi
sleep 1
rime_xklb="../../../rime_xklb";
if [ ! -d "$rime_xklb" ]; then
	echo "没有两笔词库，跳过。"
else
	echo "检测到两笔词库，是否同时安装？ y/n"
	read isInstall
	if [ "$isInstall" = "y" ] || [ "$isInstall" = "Y" ]; then
		cp -rf "$rime_xklb/rime" "$fcitx"
		echo "复制码表完成					完成"
		echo "复制所有文件					完成"
		LB="星空两笔"
	else
		echo "已拒绝安装。"
	fi
fi
sleep 1
rime_xkyb="../../../rime_xkyb";
if [ ! -d "$rime_xkyb" ]; then
	echo "没有一笔词库，跳过。"
else
	echo "检测到一笔词库，是否同时安装？ y/n"
	read isInstall
	if [ "$isInstall" = "y" ] || [ "$isInstall" = "Y" ]; then
		cp -rf "$rime_xkyb/rime" "$fcitx"
		echo "复制码表完成					完成"
		echo "复制所有文件					完成"
		YB="星空一笔"
	else
		echo "已拒绝安装。"
	fi
fi
sleep 1
clear
if [ ! -d "$rime" ]; then
	echo ""
else
	cp -rf ../*.yaml "$rime"
	echo "全局配置文件						完成"
fi
if [ ! -f "./备份/xkjd6.user.dict.yaml" ]; then
	echo "没有备份键道6用户词库跳过。"
else
	cp -rf ./备份/xkjd6.user.dict.yaml "$rime"
	echo "还原键道6用户词库					完成"
fi
if [ ! -f "./备份/xklb.user.dict.yaml" ]; then
	echo "没有备份两笔用户词库跳过。"
else
	cp -rf ./备份/xklb.user.dict.yaml "$rime"
	echo "还原两笔用户词库					完成"
fi
if [ ! -f "./备份/xkyb.user.dict.yaml" ]; then
	echo "没有备份一笔用户词库跳过。"
else
	cp -rf ./备份/xkyb.user.dict.yaml "$rime"
	echo "还原一笔用户词库					完成"
fi
sleep 2
clear
echo "预览 $rime/"
echo "==========================================="
ls "$rime"
echo "==========================================="
sleep 2
clear
echo "==========================================="
echo "已安装方案： $JDL $YB $LB"
echo "请在fcitx重新部署后再尝试使用。"
echo "==========================================="
sleep 1
exit
