cp -rf ../rime/xkjd6.cizu.dict.yaml ../BackDict/
echo 开始处理排序
sort -t $'\t' -k 2 词组.txt > xkjd6.cizu.dict.yaml
sed -i 's/\b并不比\b\t/---\nname: xkjd6.cizu\nversion: "Q1"\nsort: by_weight\n...\n&/' xkjd6.cizu.dict.yaml
echo 执行排序添加头部信息完成
cp -rf xkjd6.cizu.dict.yaml ../rime/
echo 已放置到主词库中