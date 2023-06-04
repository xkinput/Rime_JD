#
# Copyright (c) 2023 Xuesong Peng <pengxuesong.cn@gmail.com>
#
# This program is free software: you can redistribute it and/or modify  
# it under the terms of the GNU General Public License as published by  
# the Free Software Foundation, version 3.
#
# 本程序是免费软件：您可以根据自由软件基金会发布的 GNU 通用公共许可证第三版中的
# 条款重新分发和／或修改它。
#
# This program is distributed in the hope that it will be useful, but 
# WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
# General Public License for more details.
#
# 分发该程序是希望它有用，但不提供任何保证；甚至没有针对特定用途的适销性或适用性的
# 默示保证。有关详细信息，请参阅 GNU 通用公共许可证。
#
# You should have received a copy of the GNU General Public License 
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
# 您应该已随本程序收到 GNU 通用公共许可证的副本。如果没有，请参阅 <http://www.gnu.org/licenses/>
#

# 经本程序处理后的词典是未排序的，用管道传递给其他程序以进行排序，如：
# python process_data.py cizu_raw.txt | sort -k2 -s > cizu_new.txt

import csv
import sys
file = str(sys.argv[1])

# 词典原始数据文件格式应为 tab <U+0009> 隔开的字符串，其含义分别为
# 词语	音码	形码	权重	次要权重	注释
# 其中，词语字符串 "@@@" 为占位符，代表该位置由其他词典的词语补充
# 其他信息可以是注释，例如古诗的题目：
# 床前明月光，疑是地上霜。举头望明月，低头思故乡。	jys	voi	899	1	《静夜思》
# 也可以是权重相同时的附加权重，用于原始数据的排序，例如：
# 不高兴	bgx	voo	1000	2	首选
# 不敢想	bgx	vav	1000	1	次选
with open(file) as f:
    reader = csv.reader(f, delimiter="\t")
    data = list(reader)

curr_phone_3ch = ""
homophones_3ch = []
curr_phone_och = ""
homophones_och = []

class Node:
    def __init__(self, prefix, level):
        self.prefix = prefix
        self.level = level
        self.data = []
        self.children = {}
    def available(self):
        return len(self.data) == 0 or (self.level > 0 and self.prefix == "")

def insert_tree(tree, data, level):
    key = data[2][level-1:level]
    weight = int(data[3])
    if key in tree.keys():
        if tree[key].available():
            tree[key].data.append(data)
        else:
            exist_data = tree[key].data[0]
            exist_weight = int(exist_data[3])
            if weight == exist_weight:
                tree[key].data.append(data)
            elif weight > exist_weight:
                for d in tree[key].data:
                    insert_tree(tree[key].children, d, level+1)
                tree[key].data = [data]
            else:
                insert_tree(tree[key].children, data, level+1)
    else:
        tree[key] = Node(key, level)
        tree[key].data.append(data)

def print_tree(tree, prefix):
    for key, val in tree.items():
        for item in val.data:
            print(item[0] + '\t' + item[1] + prefix + val.prefix)
        print_tree(val.children, prefix + val.prefix)

def dump_tree(tree, prefix):
    result = []
    for key, val in tree.items():
        for item in val.data:
            if item[0] == "@@@":
                continue
            result.append([item[0], item[1] + prefix + val.prefix, item[3]])
        sub_result = dump_tree(val.children, prefix + val.prefix)
        result += sub_result
    result.sort(key=lambda x:(x[1], -int(x[2])))
    return result

def do_process(homophones):
    tree = {}
    for item in homophones:
        insert_tree(tree, item, 0)
    result = dump_tree(tree, '')
    for item in result:
        print(item[0] + '\t' + item[1])

for item in data:
    if int(item[3]) == 0:
        continue
    if len(item[1]) == 3:
        if item[1] != curr_phone_3ch:
            do_process(homophones_3ch)
            homophones_3ch = []
        curr_phone_3ch = item[1]
        homophones_3ch.append(item)
    else:
        if item[1] != curr_phone_och:
            do_process(homophones_och)
            homophones_och = []
        curr_phone_och = item[1]
        homophones_och.append(item)

do_process(homophones_3ch)
do_process(homophones_och)
