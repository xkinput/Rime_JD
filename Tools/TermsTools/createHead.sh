#!/bin/bash
# 注意：使用CRLF行尾序列

cizu=xkjd6.cizu.dict.yaml
danzi=xkjd6.danzi.dict.yaml
yingwen=xkjd6.yingwen.dict.yaml
wxw=xkjd6.wxw.dict.yaml
chaojizici=xkjd6.chaojizici.dict.yaml
buchong=xkjd6.buchong.dict.yaml
lianjie=xkjd6.lianjie.dict.yaml

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

if [ $(uname) == "Darwin" ];then
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.cizu\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $cizu
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.danzi\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $danzi
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.yingwen\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $yingwen
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.wxw\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $wxw
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.buchong\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $buchong
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.chaojizici\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $chaojizici
    sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.lianjie\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' $lianjie
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
