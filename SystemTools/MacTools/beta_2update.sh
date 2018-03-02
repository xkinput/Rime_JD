#!/bin/bash

# set -x
my_default="default.custom.yaml"
my_rime="$HOME/Library/Rime"

echo "开始备份"
rm -rf 备份/*
# 删除原有备份文件
mkdir 备份
cp -r ~/Library/Rime ./备份/
echo "备份原内容到当前目录下“备份”文件夹.....完成"
echo "==========================================="
echo "键道6码表升级，请选择升级方式："
echo -e "  1) [更新] 码表/schema/opencc (1)\n  2) 备份并覆盖现有 Rime 配置  (2)"
echo "-----------------------------------"
echo -e "( 若不确定该选择何种方式，请按 ctrl+c 中断脚本执行，并参阅 help.txt )\n"
echo -n "选择 (1/2): "
read my_select

echo "==========================================="
echo "检测是否配置键道6: "
case $my_select in
  "1")
    if [ -f "$my_rime/$my_default" ]; then
	xkjd6=$(grep "^ \+\- schema: xkjd6$" $my_rime/$my_default)
	xkjd6dz=$(grep "^ \+\- schema: xkjd6dz$" $my_rime/$my_default)
	if [[ -z $xkjd6 ]] && [[ -z $xkjd6dz ]]; then
	  sed -i '' -E $'/schema_list:/s/$/\\\n    - schema: xkjd6/g' $my_rime/$my_default
	  sed -i '' -E $'/schema_list:/s/$/\\\n    - schema: xkjd6dz/g' $my_rime/$my_default
	  echo -e "添加键道6方案到 $my_default ..................完成"
	elif [[ -z $xkjd6 ]] && [[ -n $xkjd6dz ]]; then
	  sed -i '' -E $'/schema_list:/s/$/\\\n    - schema: xkjd6/g' $my_rime/$my_default
	  echo -e "添加键道6主方案到 $my_default ................完成"
	elif [[ -n $xkjd6 ]] && [[ -z $xkjd6dz ]]; then
	  sed -i '' -E $'/schema_list:/s/$/\\\n    - schema: xkjd6dz/g' $my_rime/$my_default
	  echo -e "添加键道6单字方案到 $my_default ..............完成"
	else
	  echo -e "已设置键道6"
	fi
    else
	cp  ../../rime/$my_default $my_rime
	echo "复制Rime用户配置文件...................完成"
    fi
    echo -e "---------------------\n"
    rsync -aqurI ../../rime/ --include="*.dict.yaml" --include="*.schema.yaml" --include=/opencc --exclude=/* $my_rime
    rsync -aquI ../rime/*.schema.yaml $my_rime
  ;;
  "2")
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
  ;;
esac
echo "==========================================="
NAME=../rime/Linux/name.txt
echo "              本文件Rime方案为 "`cat $NAME`" "
echo "已完成安装"
echo "请重新部署后再尝试使用。"
echo "==========================================="
sleep 1
exit
