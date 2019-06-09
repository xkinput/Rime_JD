#!/bin/bash
cizu=xkjd6.cizu.dict.yaml
danzi=xkjd6.danzi.dict.yaml
yingwen=xkjd6.yingwen.dict.yaml
wxw=xkjd6.wxw.dict.yaml
chaojizici=xkjd6.chaojizici.dict.yaml
buchong=xkjd6.buchong.dict.yaml
lianjie=xkjd6.lianjie.dict.yaml

cp -rf ../../rime/$cizu ../BackDict/
cp -rf ../../rime/$danzi ../BackDict/
cp -rf ../../rime/$yingwen ../BackDict/
cp -rf ../../rime/$wxw ../BackDict/
cp -rf ../../rime/$chaojizici ../BackDict/
cp -rf ../../rime/$buchong ../BackDict/
cp -rf ../../rime/$lianjie ../BackDict/

git add ../BackDict/*
git commit -m "更新：备份旧词库"

echo 清理旧排序文件
rm $cizu
rm $danzi
rm $yingwen
rm $wxw
rm $chaojizici
rm $buchong
rm $lianjie
clear
echo 创建词库
cp -rf cizu.txt ./$cizu
cp -rf danzi.txt ./$danzi
cp -rf yingwen.txt ./$yingwen
cp -rf wxw.txt ./$wxw
cp -rf chaojizici.txt ./$chaojizici
cp -rf buchong.txt ./$buchong
cp -rf lianjie.txt ./$lianjie

# 附加单字全码
cat danziall.txt >> $danzi
cp -rf $cizu ../../rime/opencc/WXWPromptFilters.txt
echo 更为630简码提示词库

if [ $(uname) == "Darwin" ];then

    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.cizu\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $cizu
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.danzi\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $danzi
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.yingwen\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $yingwen
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.wxw\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $wxw
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.buchong\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $buchong
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.chaojizici\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $chaojizici
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.lianjie\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $lianjie

    if [[ (-x "$(command -v python3)") && (-f "make_wxw_json.py") ]];then
	python3 make_wxw_json.py
        echo "630 词组提示更新完毕"
    else
        echo "630 词组提示尚未更新"
    fi

else
    sed -i '1 i---\nname: xkjd6.cizu\nversion: "Q1"\nsort: original\n...' $cizu
    sed -i '1 i---\nname: xkjd6.danzi\nversion: "Q1"\nsort: original\n...' $danzi
    sed -i '1 i---\nname: xkjd6.yingwen\nversion: "Q1"\nsort: original\n...' $yingwen
    sed -i '1 i---\nname: xkjd6.wxw\nversion: "Q1"\nsort: original\n...' $wxw
    sed -i '1 i---\nname: xkjd6.chaojizici\nversion: "Q1"\nsort: original\n...' $chaojizici
    sed -i '1 i---\nname: xkjd6.buchong\nversion: "Q1"\nsort: original\n...' $buchong
    sed -i '1 i---\nname: xkjd6.lianjie\nversion: "Q1"\nsort: original\n...' $lianjie
fi

echo 执行排序添加头部信息完成
cp -rf $cizu ../../rime/
cp -rf $danzi ../../rime/
cp -rf $yingwen ../../rime/
cp -rf $wxw ../../rime/
cp -rf $buchong ../../rime/
cp -rf $chaojizici ../../rime/
cp -rf $lianjie ../../rime/
echo 已放置到主词库中

git add . ../../rime/*

read -p "请输入更新词库依据: [默认为议表]" upgradeOrigin

if [ -z $upgradeOrigin ];then
  git commit -m "更新：据议表更新词库"
else
  git commit -m "更新：据$upgradeOrigin提供词组更新词库"
fi

git push origin master
