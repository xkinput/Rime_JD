#!/bin/bash

cp -rf ../rime/xklb.cizu.dict.yaml ../BackDict/
cp -rf ../rime/xklb.danzi.dict.yaml ../BackDict/
cp -rf ../rime/xklb.yingwen.dict.yaml ../BackDict/
# git add ../BackDict/xklb.cizu.dict.yaml ../BackDict/xklb.danzi.dict.yaml ../BackDict/xklb.yingwen.dict.yaml
# git commit -m "更新：备份旧词库"
echo 开始处理排序
sort -t $'\t' -k 2 词组.txt > xklb.cizu.dict.yaml
sort -t $'\t' -k 2 单字.txt > xklb.danzi.dict.yaml
sort -t $'\t' -k 2 英文.txt > xklb.yingwen.dict.yaml
cp -rf xklb.cizu.dict.yaml ./词组.txt
cp -rf xklb.danzi.dict.yaml ./单字.txt
cp -rf xklb.yingwen.dict.yaml ./英文.txt
echo 更为当前文件
sed -i '' -E $'1 i\\\n---\\\nname: xklb.cizu\\\nversion: "Q1"\\\nsort: by_weight\\\n...\\\n' xklb.cizu.dict.yaml
sed -i '' -E $'1 i\\\n---\\\nname: xklb.danzi\\\nversion: "Q1"\\\nsort: by_weight\\\n...\\\n' xklb.danzi.dict.yaml
sed -i '' -E $'1 i\\\n---\\\nname: xklb.yingwen\\\nversion: "Q1"\\\nsort: by_weight\\\n...\\\n' xklb.yingwen.dict.yaml
echo 执行排序添加头部信息完成
cp -rf xklb.cizu.dict.yaml ../rime/
cp -rf xklb.danzi.dict.yaml ../rime/
cp -rf xklb.yingwen.dict.yaml ../rime/
echo 已放置到主词库中
