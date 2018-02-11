#!/bin/bash

# set -x
my_default="default.custom.yaml"
my_rime="$HOME/Library/Rime"

echo "开始备份"
# rm -rf 备份/*
# 删除原有备份文件
# mkdir 备份
# cp -r ~/Library/Rime ./备份/
echo "备份原内容到当前目录下“备份”文件夹完成"
echo "==========================================="
echo "键道6码表升级，请选择升级方式："
echo -e "  1) [更新] 码表/schema/opencc (y)\n  2) 备份并覆盖现有 Rime 配置  (n)"
echo "-----------------------------------"
echo -e "( 若不确定该选择何种方式，请按 ctrl+c，并参考「使用帮助.txt」 )\n"
echo -n "选择 (y/n): "
read my_select

echo "==========================================="
echo "检测是否已配置键道6: "
case $my_select in
  "y")
     if [ -f "$my_rime/$my_default" ]; then
	xkjd6=$(grep "^ \+\- schema: xkjd6" $my_rime/$my_default)
	xkjd6dz=$(grep "^ \+\- schema: xkjd6dz" $my_rime/$my_default)
	if [ ${#xkjd6} -eq 0 ] && [ ${#xkjd6dz} -eq 0 ]; then
	  sed -i '' -E $'/schema_list:/s/$/\\\n    - schema: xkjd6/g' $my_rime/$my_default
	  sed -i '' -E $'/schema_list:/s/$/\\\n    - schema: xkjd6dz/g' $my_rime/$my_default
	  echo "  添加键道6方案到 $my_default"
	elif [ ${#xkjd6} -eq 0 ] && [ ${#xkjd6dz} -gt 0 ]; then
	  sed -i '' -E $'/schema_list:/s/$/\\\n    - schema: xkjd6/g' $my_rime/$my_default
	  echo "  添加键道6主方案到 $my_default"
	elif [ ${#xkjd6} -gt 0 ] && [ ${#xkjd6dz} -eq 0 ]; then
	  sed -i '' -E $'/schema_list:/s/$/\\\n    - schema: xkjd6dz/g' $my_rime/$my_default
	  echo "  添加键道6单字方案到 $my_default"
	else
	  echo "  $my_default 已设置键道6"
	fi
     else
	cp  ../../rime/$my_default $my_rime
	echo "复制Rime用户配置文件完成"
     fi
     rsync -avurI ../../rime/ --include="*.dict.yaml" --include="*.schema.yaml" --include=/opencc --exclude=/* $my_rime
     rsync -avuI ../rime/*.schema.yaml $my_rime
  ;;
  "n")
     rm -rf ~/Library/Rime
     echo "清空配置文件目录完成"
     cp -r ../../rime ~/Library/Rime
     echo "复制Rime用户码表文件完成"
     cp -r ../rime ~/Library/Rime
     echo "复制Rime用户配置文件完成"
     cp -r ../rime/Mac/* ~/Library/Rime
     cp -r ../rime/*.yaml ~/Library/Rime/
     echo "复制Rime配置独有文件完成"
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
