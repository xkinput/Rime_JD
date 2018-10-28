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

echo 开始处理排序
sort -t $'\t' -k 2 cizu.txt > $cizu
sort -t $'\t' -k 2 danzi.txt > $danzi
sort -t $'\t' -k 2 yingwen.txt > $yingwen
sort -t $'\t' -k 2 wxw.txt > $wxw
sort -t $'\t' -k 2 chaojizici.txt > $chaojizici
# 以下不可重新排序,已复制放入
# sort -t $'\t' -k 2 buchong.txt > $buchong
# sort -t $'\t' -k 2 lianjie.txt > $lianjie
cp -rf buchong.txt ./$buchong
cp -rf lianjie.txt ./$lianjie

cp -rf $cizu ./cizu.txt
cp -rf $danzi ./danzi.txt
cp -rf $yingwen ./yingwen.txt
cp -rf $wxw ./wxw.txt
cp -rf $chaojizici ./chaojizici.txt
cp -rf $buchong ./buchong.txt
cp -rf $lianjie ./lianjie.txt

echo 更为当前文件

# 附加单字全码
cat danziall.txt >> $danzi
cp -rf $cizu ../../rime/opencc/WXWPromptFilters.txt
echo 更为630简码提示词库

sed -i '1 i---\nname: xkjd6.cizu\nversion: "Q1"\nsort: original\n...' $cizu
sed -i '1 i---\nname: xkjd6.danzi\nversion: "Q1"\nsort: original\n...' $danzi
sed -i '1 i---\nname: xkjd6.yingwen\nversion: "Q1"\nsort: original\n...' $yingwen
sed -i '1 i---\nname: xkjd6.wxw\nversion: "Q1"\nsort: original\n...' $wxw
sed -i '1 i---\nname: xkjd6.chaojizici\nversion: "Q1"\nsort: original\n...' $chaojizici
sed -i '1 i---\nname: xkjd6.buchong\nversion: "Q1"\nsort: original\n...' $buchong
sed -i '1 i---\nname: xkjd6.lianjie\nversion: "Q1"\nsort: original\n...' $lianjie

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
read -p "更新内容为：" cont
git commit -m "更新：$cont"
git push
