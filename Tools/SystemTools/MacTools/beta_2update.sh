#!/bin/bash

# set -x
rootDir=`dirname $0`
cd $rootDir
xkjd="../../../../Rime_JD/rime"
xklb="../../../../rime_xklb"
xkyb="../../../../rime_xkyb"
my_default="default.custom.yaml"
rime="$HOME/Library/Rime"

JD=""
YB=""
LB=""
xk_name=""

testHasSchema(){

  check_dir=$(pwd | sed -E $'s/.*\\/(.{1,})\\/Tools\\/SystemTools\\/MacTools/\\1/')
  echo "$check_dir"
  case $check_dir in
    "Rime_JD")
      xk_ID="xkjd6"
      xk_dzID="xkjd6dz"
      xk_name="键道6"
      xk_path=$xkjd
      ;;
    "rime_xklb")
      xk_ID="xklb"
      xk_dzID="xklbdz"
      xk_name="两笔"
      xk_path=$xklb
      ;;
    "rime_xkyb")
      xk_ID="xkyb"
      xk_dzID="xkybdz"
      xk_name="一笔"
      xk_path=$xkyb
      ;;
  esac

    echo "==========================================="
    echo "检测是否配置「 $xk_name 」方案: "
    if [ -f "$rime/$my_default" ]; then
	xk_is_ID=$(grep "^ \+\- schema: $xk_ID$" $rime/$my_default)
	xk_is_dzID=$(grep "^ \+\- schema: $xk_dzID$" $rime/$my_default)
	if [[ -z $xk_is_ID ]] && [[ -z $xk_is_dzID ]]; then
	  sed -i '' -E $'/schema_list:/s/$/\\\n    - schema: '"$xk_ID"'/g' $rime/$my_default
	  sed -i '' -E $'/schema_list:/s/$/\\\n    - schema: '"$xk_dzID"'/g' $rime/$my_default
	  echo -e "添加$xk_name方案到 $my_default ..................完成"
	elif [[ -z $xk_is_ID ]] && [[ -n $xk_is_dzID ]]; then
	  sed -i '' -E $'/schema_list:/s/$/\\\n    - schema: '"$xk_ID"'/g' $rime/$my_default
	  echo -e "添加$xk_name主方案到 $my_default ................完成"
	elif [[ -n $xk_is_ID ]] && [[ -z $xk_is_dzID ]]; then
	  sed -i '' -E $'/schema_list:/s/$/\\\n    - schema: '"$xk_dzID"'/g' $rime/$my_default
	  echo -e "添加$xk_name单字方案到 $my_default ..............完成"
	else
	  echo -e "已设置$xk_name"
	fi
    else
	cp  ../default*yaml $rime
	echo "复制Rime用户配置文件...................完成"
    fi
    echo -e "---------------------\n"
    rsync -avhu --progress $xk_path/ --include="*.dict.yaml" --include="*.schema.yaml" --include=/opencc --exclude="xkjd6.extended.dict.yaml" --exclude="xkjd6dz.extended.dict.yaml" --exclude=/* $rime
    rsync -avhu --progress $xk_path/*.schema.yaml $rime

}

echo "开始备份"
rm -rf 备份/*
# 删除原有备份文件
mkdir 备份 2> /dev/null
cp -r $rime/* ./备份/
echo "备份原内容到当前目录下“备份”文件夹.....完成"
echo "==========================================="
echo "码表更新，请选择升级方式："
echo -e "  1) [更新] 码表/schema/opencc (1)\n  2) 备份并覆盖现有 Rime 配置  (2)"
echo "-----------------------------------"
echo -e "( 若不确定该选择何种方式，请按 ctrl+c 中断脚本执行，并参阅 help.txt )\n"
echo -n "选择 (1/2): "
read my_select

case $my_select in
  "1")
    testHasSchema
  ;;
  "2")
    ./2update.sh
    exit
  ;;
  *)
    echo "退出当前脚本执行"
    exit
  ;;
esac

echo "==========================================="
sleep 2
clear
echo "已安装方案：$xk_name"
/Library/Input\ Methods/Squirrel.app/Contents/MacOS/Squirrel --reload
if [ "$?" -ne 0 ]; then
    echo "请在鼠须管重新部署后再尝试使用。"
else
    echo "部署成功，可尝试使用。"
fi
echo "==========================================="
sleep 1
exit
