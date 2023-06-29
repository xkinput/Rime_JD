# 词库工具说明

## 脚本列表

### Bash 脚本

- `createHead.sh`: 更新好 .txt 词库后，使用这个脚本来创建 .yaml 词库
- `process.sh`: 从 raw 格式的 cizu_raw.txt 生成 cizu.txt，目前处于试用阶段，将来稳定后可以合并到 `createHead.sh` 里
- ~~`DDMergeAllTerms.sh`~~: 为多多输入法生成合并词库（目前应该不维护多多平台了）
- ~~`RimeMergeAllTerms.ssh`~~: 为 Rime 平台生成合并词库（目前使用 github action 自动生成，可以在 [min 分支](https://github.com/xkinput/Rime_JD/tree/min)找到，不需要这个脚本来做了）
- `push.sh`: 推送到 Master 分支，建议直接使用 git 命令而非这个脚本（由于在 github 上设置了分支保护，不允许直接推送，请先推送到自己的仓库再提交 PR）

### Python 脚本

- `process_data.py`: 不直接使用，会从 `process.sh` 里调用，用于从 cizu_raw.txt 生成 cizu.txt
- ~~`make_wxw_json.py`~~: 已弃用，古代由 OpenCC 实现 630 提示时使用的脚本，目前使用 lua 实现 630 提示，已不需要了

## 词库维护流程


1. 按需编辑 cizu_raw.txt（参考[原始格式词库详解](#原始raw格式词库详解)）
2. 按需编辑 buchong.txt, chaojizici.txt, danzi.txt, lianjie.txt, wxw.txt, yingwen.txt
3. 执行 `bash process.sh`（Windows 用户请使用 WSL 来做，请确保 WSL 里安装了 python3）
4. 执行 `bash createHead.sh`（Windows 用户请使用 WSL 来做）
5. 检查改动前后的词典有无错误
6. 提交到自己的仓库，发 PR

对于**个人词库**，上面的步骤 1 如同直接编辑 cizu_raw.txt 的代价是，当官方更新后，自己需要跟进的话，需要话更多时间检查。因此，对于步骤 1，推荐使用「补丁」的方式来维护自己的词组，详见[添加新的词语](#添加新的词语)和[调整权重](#调整权重)。

## 原始（raw）格式词库详解

> 当初的 PR 可以在[这里](https://github.com/xkinput/Rime_JD/pull/53)找到，包含了一些讨论和答疑。

键道用户都知道，对于单字，键道词库是会保留全码的，但对于词语，全码的信息在词库里是会丢失的。这导致了一个问题，就是需要加词、删词、调序的时候，需要更多的人工精力去关注形码的增减。而 raw 格式包含了所有音码和形码的信息，可以减少这方面的精力投入，单纯关注词语间的相对顺序（权重的比较）。

使用脚本把 cizu_raw.txt 转换为 cizu.txt 时，脚本会把相同音码的词语放到一起考虑，根据权重的不同，由大到小排列，最大的词语会删除所有形码，后面的词语在**重码时**会依次增加一个形码字母直到全码。注意，当两个同声码的词语权重相同时会占用同一个编码，可以使用附加权重来区分首选次选。

### 词条格式

文件名 cizu_raw.txt，每行一个词条，分为六列，用 Tab 隔开，附加权重和注释通常省略

```text
词语	音码	形码	权重	附加权重	注释
```

例如：

```text
并不比	bbb	ovv	1000
白板笔	bbb	uvu	899
彬彬	bbbb	vv	1000
斌斌	bbbb	oo	899
并不表示	bbbe	ov	1000
宾白	bbbh	ou	1000
宾部	bbbj	oo	1000
宾补	bbbj	oo	899
```

权重相同，需要区分首选次选时，使用附加权重来排序，如：

```text
不高兴	bgx	voo	1000	2	首选
不敢想	bgx	vav	1000	1	次选
```

当需要空出编码，使用 `@@@` 作为词语可以占位，如：

```text
@@@	kls	???	1000	1	让位「IOS」
@@@	qeq	???	1000	1	平衡「这事情」飞键
```

### 添加新的词语

对于**官方词库**的维护，可以直接在 cizu_raw.txt 里按照格式添加，运行 `bash process.sh` 后会自动排序 cizu_raw.txt，所以不用特别在意添加的顺序。

对于**官方词库**或者**个人词库**的维护，也可以按照 raw 格式把要添加的词语放到另外一个补丁文件，如 cizu_raw_add.txt 里，然后运行下面的命令来合并到 cizu_raw.txt 里，之后再运行 `bash process.sh`

```bash
cat cizu_raw.txt cizu_raw_add.txt | awk '!seen[$1,$2]++' >cizu_raw_merged.txt
mv cizu_raw_merged.txt cizu_raw.txt
```

### 调整权重

对于**官方词库**的维护，可以直接在 cizu_raw.txt 里调整权重，同样地，运行 `bash process.sh` 后会自动按照新的权重排序，不需要手动调整顺序。

对于**官方词库**或者**个人词库**的维护，可以用一个补丁文件来记录需要增减的权重，如 cizu_patch.txt，格式需要包含「词语」、「声码」、「权重差」，如：

```text
彬彬	bbbb	-300
宾补	bbbj	+200
```

表示「彬彬 bbbb」的权重减少300，而「宾部 bbbj」的权重增加200。使用如下命令就可以生成调整权重后的 raw 格式文本，之后再执行 `bash process.sh`

```bash
awk -v OFS='\t' 'NR==FNR {map[$1,$2] = $3; next} {print $1,$2,$3,$4+map[$1,$2],$5,$6}' cizu_patch.txt cizu_raw.txt > result.txt
mv result.txt cizu_raw.txt
```

详细解释可以看[这个讨论](https://github.com/xkinput/Rime_JD/discussions/54)。

