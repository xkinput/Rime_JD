#!/bin/bash

cp -rf ../rime/xkjd6.cizu.dict.yaml ../BackDict/
cp -rf ../rime/xkjd6.danzi.dict.yaml ../BackDict/
cp -rf ../rime/xkjd6.yingwen.dict.yaml ../BackDict/
# git add ../BackDict/xkjd6.cizu.dict.yaml ../BackDict/xkjd6.danzi.dict.yaml ../BackDict/xkjd6.yingwen.dict.yaml
# git commit -m "更新：备份旧词库"
echo 开始处理排序
sort -t $'\t' -k 2 词组.txt > xkjd6.cizu.dict.yaml
sort -t $'\t' -k 2 单字.txt > xkjd6.danzi.dict.yaml
sort -t $'\t' -k 2 英文.txt > xkjd6.yingwen.dict.yaml
cp -rf xkjd6.cizu.dict.yaml ./词组.txt
cp -rf xkjd6.danzi.dict.yaml ./单字.txt
cp -rf xkjd6.yingwen.dict.yaml ./英文.txt
echo 更为当前文件
sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.cizu\\\nversion: "Q1"\\\nsort: by_weight\\\n...\\\n' xkjd6.cizu.dict.yaml
sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.danzi\\\nversion: "Q1"\\\nsort: by_weight\\\n...\\\n' xkjd6.danzi.dict.yaml
sed -i '' -E $'1 i\\\n---\\\nname: xkjd6.yingwen\\\nversion: "Q1"\\\nsort: by_weight\\\n...\\\n' xkjd6.yingwen.dict.yaml
echo 执行排序添加头部信息完成
cp -rf xkjd6.cizu.dict.yaml ../rime/
cp -rf xkjd6.danzi.dict.yaml ../rime/
cp -rf xkjd6.yingwen.dict.yaml ../rime/
echo 已放置到主词库中