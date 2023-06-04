# 根据肥肥的 macOS 测试，需要这句才能让 sort 正常执行
export LC_ALL='C'

# cizu_raw.txt 有了新的改动后，首先给它排序
# 排序依据：第二列（音码），第四列（权重），第五列（附加权重），第三列（形码）
sort -k2,2 -k4,4nr -k5,5nr -k3,3 cizu_raw.txt > temp.txt
mv temp.txt cizu_raw.txt

# 处理之后的结果也需要排序，按照第二列（输出的编码）排序
python3 process_data.py cizu_raw.txt | sort -k2 -s > cizu.txt
