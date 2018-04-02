#!/bin/bash

xkjd="../../../Rime_JD/rime"
xklb="../../../rime_xklb"
xkyb="../../../rime_xkyb"
rime="$HOME/Library/Rime"
bak="./备份"

JDL=""
YB=""
LB=""

count=0

isHaveDict (){
# $1: schema name
# $2: filepath
# $3: rime_xk..
    if [ ! -e $2 ]; then
    	echo "没有$1词库，跳过。"
    else
    	echo "检测到$1词库，是否同时安装？ y/n"
    	read isInstall
    	if [[ "$isInstall" == [yY] ]]; then
    		cp -rf $2/rime/*.yaml $rime
    		echo "复制码表完成					完成"
    		echo "复制所有文件					完成"
		count=$(expr $count + 1)
		return  1
    	else
    		echo "已拒绝安装。"
		return  0
    	fi
    fi
}

isHaveUserDict() {
# $1: 键道6 / 两笔 / 一笔
# $2: xkjd6 / xkyb / xklb
    if [ ! -f $bak/$2 ]; then
	echo "· 没有备份$1用户词库跳过。"
    else
	cp -rf $bak/$2 "$rime"
	echo "· 还原$1用户词库					完成"
    fi
}

# ====================================================================
clear

# 检测备份目录
if [ ! -d $bak ]; then
	clear
	mkdir 备份
else
	rm -rf 备份/*
fi

if [ ! -f "$rime/default.yaml" ]; then
	echo "· 未发现$rime无需备份"
else
	cp -rf $rime/* ./备份/
	echo "· 备份“$rime”到“$bak”文件夹	完成"
fi

sleep 1

#清空Rime目录
if [ ! -d $rime ]; then
	mkdir $rime
else
	rm -rf $rime
	mkdir $rime
fi
clear

isHaveDict "键道6" $xkjd
if [ $? == 1 ]; then
    cp -rf ../rime/*.yaml $rime/
    JDL="键道6"
fi

isHaveDict "一笔" $xkyb
if [ $? == 1 ]; then
    YB="一笔"
fi

isHaveDict "两笔" $xklb
if [ $? == 1 ]; then
	LB="两笔"
fi

sleep 1
clear

if [ ! -f "$rime" ]; then
	echo ""
else
	cp -rf ../*.yaml "$rime"
	echo "全局配置文件						完成"
fi

isHaveUserDict "键道6" "xkjd6.user.dict.yaml"
isHaveUserDict "一笔" "xkyb.user.dict.yaml"
isHaveUserDict "两笔" "xklb.user.dict.yaml"

clear
echo "预览 $rime/"
echo "==========================================="
if [ ! -d $rime ]; then
	echo "未发现$rime"
else
	ls "$rime"
fi
echo "==========================================="
sleep 2
clear
echo "==========================================="
echo "已安装方案：$count个 $JD $YB $LB"
echo "请在fcitx重新部署后再尝试使用。"
echo "==========================================="
sleep 1
exit
