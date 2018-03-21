#!/bin/bash

rime_xkjd="../.."
rime_xklb="../../../rime_xklb"
rime_xkyb="../../../rime_xkyb"
rime="$HOME/Library/Rime"
JDL=""
YB=""
LB=""

if_schema (){
# $1: filepath
# $2: name
# $3: rime_xk..
    if [ ! -e $1 ]; then
    	echo "没有$2词库，跳过。"
    else
    	echo "检测到$2词库，是否同时安装？ y/n"
    	read isInstall
    	if [[ "$isInstall" == [yY] ]]; then
    		cp -rf "$3/rime" $rime
    		echo "复制码表完成					完成"
    		echo "复制所有文件					完成"
		return  3
    	else
    		echo "已拒绝安装。"
		return  4
    	fi
    fi
    sleep 1
  }

if_user_dict() {
# $1: xkjd6 / xkyb / xklb
# $2: 键道6 / 两笔 / 一笔
    if [ ! -f "./备份/$1.user.dict.yaml" ]; then
    	echo "没有备份$2用户词库跳过。"
    else
    	cp -rf ./备份/$1.user.dict.yaml $rime
    	echo "还原$2用户词库					完成"
    fi
    sleep 2
  }

# ====================================================================
clear

if [ ! -d "./备份" ]; then
	clear
	mkdir 备份
else
	rm -rf 备份/*
fi

if [ ! -f "$rime/default.yaml" ]; then
	echo "无需备份"
else
	cp -rf $rime/* ./备份/
	echo "备份“用户文件夹”到“备份”文件夹	完成"
fi

sleep 1
rm -rf "$rime"
echo "清空配置文件目录					完成"
clear

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

if_schema $rime_xkjd "键道6" "rime_xkjd"  
if [ $? == 3 ];then
  JDL="键道6"
fi

if_schema $rime_xkyb "一笔"  "rime_xkyb"  
if [ $? == 3 ];then
  YB="一笔"
fi

if_schema $rime_xklb "两笔"  "rime_xklb"  
if [ $? == 3 ];then
  LB="两笔"
fi

if [ ! -f "$rime" ]; then
	echo ""
else
	cp -rf ../*.yaml "$rime"
	echo "全局配置文件						完成"
fi

if_user_dict "xkjd6" "键道6"
if_user_dict "xkyb"  "一笔"
if_user_dict "xklb"  "两笔"

clear
echo "预览 $rime/"
echo "==========================================="
ls "$rime"
echo "==========================================="
sleep 2
clear
echo "==========================================="
echo "已安装方案： $JDL $YB $LB"
echo "请重新部署后再尝试使用。"
echo "==========================================="
sleep 1

exit
