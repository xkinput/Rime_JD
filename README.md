<h1 align="center">星空键道6</h1>

>作者：**吅吅大山** [**键道官网**][904]  [**键道6词库议表**][916]  [**键道6查码工具**][917]  [加入官方群:320053116][903]

>文档： 键道6方案文档[ wiki文档][921] [下载][920]
---
#### 目录结构说明：

| 路径 | 作用 |
| :-------------|:-------------: |
| /Tools | 工具目录 |
| /Tools/BackDict | 备份上次码表 |
| /Tools/Extended | 扩展码表 |
| /Tools/SystemTools | 各系统配置文件工具 |
| /Tools/TermsTools | 词组排序工具 |
| /rime | 主码表文件夹[主码表] |
| README.md | readme.md 说明文件 |

---

#### 首次安装：
  * Windows 首选安装方式： [Windows键道6安装程序下载][914]  
    > 说明：打包内包含完整本项目，克隆完成后，请按照下面 Git 安装后同步最新码表 `git pull` 后，升级到最新码表。

  * Linux 首选安装方式： 
    终端执行：
    `wget -O installJDL.sh https://gitee.com/xkinput/xkinput/raw/master/public/installJDL.sh && sudo chmod +x installJDL.sh && ./installJDL.sh`

    或者：
    下载[附件][923]脚本，切换到脚本所在目录终端执行：  
    `./installJDL.sh`

    > 注意：请确保设备含有网络、可使用项目内配备的升级工具做升级码表到最新。

  * Android 首选安装方式：[Android键道6安装包][915]
    > 说明：打包内包含码表与皮肤，安装完成后，请按照下面 Git 安装后同步最新码表 `git pull` 后，复制最新码表到对应用户目录，重新部署以升级到最新码表。
    <a name="ios-install"></a>
  * iOS 首选安装方式：
    - iRime：至 app store 搜寻 iRime 下载 app，并参考[iRime指导教程][913]
    - 落格（付费软件）：至 app store 搜寻落格下载 app，至「对数云-主码表」下载「星空键道6.2 -- 官方版本]

#### 安装 Git 使用说明：使用 Git 程序（可滚动更新）

 **[Git下载地址罗列][918]**

 * Windows 系统 Git：[官网][905]|[微云][912]
 * Linux 系统 Git：[自行安装]
 * Mac 系统 Git：内建 git 程序，无需另外安装
 * Android 系统 Git：[下载(Pocket Git)][910]
 * iOS 系统：现阶段无法使用 git 更新，请参考[首次安装方式](#ios-install)

##### 使用简述：
1. 需要安装 Git 后，将克隆项目到本地（打开 git bash 中输入，下面一样的）
`git clone https://gitee.com/xkinput/Rime_JD`
2. 切换到项目文件夹
`cd Rime_JD`
3. 在文件管理器打开当前目录（`pwd` 可以查看目录位置），进入 Rime_JD/Tools/SystemTools/ 对应系统的工具目录执行复制码表工具（1install），再重新部署即可更新完成

##### 获取更新：
1. 获取上游地址的 master 分支
`git pull`
2. 获取后，执行复制码表工具（2update），再重新部署即可更新完成

#### 最后：
> 重新部署，并尝试输入文字。安装完成。

#### 键道6方案[wiki文档][921] [下载][920]

#### 扩展说明：
1. 扩展控制文件为 xkjd6.extended.dict.yaml / xkjd6dz.extended.dict.yaml
2. 文件中有详细说明。

#### 分支说明：
> master 为定期更新稳定内容。

---
#### 若你想要发起 PR 为本项目做出贡献：

##### 创建远程仓库，指向 PR 提交者的仓库
1. 指定上游地址  
    `git remote add upstream https://gitee.com/xkinput/Rime_JD.git`
2. 从该远程仓库拉取代码  
    `git fetch upstream`
    > **如果上游更新内容含有 缩减仓库历史，请在 push 代码前 pull rebase  
    > 详见：[缩减仓库说明][908]**
3. 将该仓库的上游分支合并到自己分支  
    `git merge upstream`
4. 推送到自己的仓库  
    `git push origin master`

##### 提交commit规范：
* 码表分类：[据议表调整： x个] 外加调整：词组 编码... x个
* 工具类：系统名：工具名 文件名 纠错/添加/删除

> 详见：**[git-简明指南][909] / [git入门][919] [码云PR教程][907] / [博客PR教程][906] / [缩减仓库说明][908]**

---
### 星空系列其他 Rime 方案：

| [Morler][214] | [歌颂][216] |
| ------------- | ---------- |
| [星空两笔][213] | [星空一笔 OR 星空一道][217] |
---
### 键道6第三方维护版本：

| RIME | 小小 | 
| ------------- |:-------------:|
| [Qshu][204] | [thxnder][206] |
| [主页][204] | [主页][205] |
---
### 扩展词库：

| 正體字碼表 | 二分词库 | 诗词引导 | 
| ------------- |:-------------:|:-------------:|
| [岳飞丫飞][207] | 吅吅大山 | [thxnder][206] |
| [主页][207] |   | [主页][206] |
---
### 键道可以运行在以下平台中：

| Windows | Linux | Apple 装置 | Android
| ------------- |:-------------:|:-------------:|:-----:
| [Windows(weasel)][101] | [Linux(ibus-rime)][104] | [Mac(squirrel)][102] | [Android(trime)][105] 
| [Windows(小小)][203] | [Linux(fcitx-rime)][103] | [iOS(iRime)][106] | [Android(小小)][203]
| [Windows(多多)][108] | [Linux(小小)][203] | [iOS(落格)][107]

> 键道的跨平台使用离不开以上优秀的输入平台

[998]: https://gitee.com/thxnder/xxjd/tree/master/release "新版本小小键道"
[999]: https://gitee.com/xkinput/Rime_JD "新版本RIME键道"

[101]: https://github.com/rime/weasel "小狼毫－Rime 輸入法 for Windows"
[102]: https://github.com/rime/squirrel "鼠鬚管－Rime 輸入法 for Mac OS X"
[103]: https://github.com/fcitx/fcitx-rime "fcitx-rime for Linux"
[104]: https://github.com/rime/ibus-rime "ibus-rime for Linux"
[105]: https://github.com/osfans/trime "同文－TRime 輸入法 for Android"
[106]: https://github.com/jimmy54/iRime "iRime 輸入法 for IOS"
[107]: https://im.logcg.com/ "落格输入法 for IOS"
[108]: https://chinput.com/portal.php "多多 for Windows"

[200]: https://github.com/rime "RIME作者地址"
[201]: http://rime.im "rime主页"
[202]: https://github.com/osfans "TRIME作者页面"
[203]: https://github.com/dgod/yong "小小主页"
[204]: https://gitee.com/xkinput/Rime_JD "Rime键道主页"
[205]: http://thxnder.gitee.io/xxjd "小小键道主页"
[206]: https://gitee.com/thxnder "「小小键道」 维护者"
[207]: https://gitee.com/lyserenity/xkjd6 "正体字码表"
[208]: https://gitee.com/xkinput/Rime_JD/releases "发行页"
[209]: https://gitee.com/xkinput/Rime_JD/repository/archive/master.zip "Download"
[210]: https://gitee.com/xkinput/Rime_JD/tree/master/Tools/SystemTools "/Tools/SystemTools"
[211]: https://gitee.com/xkinput/Rime_JD/tree/master/rime "/rime"
[212]: https://gitee.com/xkinput/Rime_JD/tree/master/SystemTools/Android "Android"
[213]: https://gitee.com/morler/rime_xklb "两笔地址"
[214]: https://gitee.com/morler "Morler"
[215]: https://github.com/dzyht/rime_xkyb "一笔地址"
[216]: https://gitee.com/dzyht "歌颂"
[217]: https://gitee.com/dzyht/rime_xkybd "一笔一道地址"

[901]: https://gitee.com/thxnder/xxjd/blob/master/doc/xkjd3.md "星空键道 简明教程"
[902]: http://daniushuangpin.ys168.com "吅吅大山的的网盘"
[903]: https://jq.qq.com/?_wv=1027&k=5sTEYIQ "吅吅大山的QQ群"
[904]: https://xkinput.gitee.io "键道官网"
[905]: https://git-scm.com/ "Git"
[906]: http://www.ruanyifeng.com/blog/2017/07/pull_request.html "阮一峰PR教程"
[907]: http://git.mydoc.io/?t=180700 "码云PR教程"
[908]: http://git.mydoc.io/?t=83153 "码云缩减仓库说明"
[909]: http://rogerdudler.github.io/git-guide/index.zh.html "git - 简明指南"
[910]: http://sj.qq.com/myapp/detail.htm?apkName=com.aor.pocketgit "Pocket Git（口袋Git）"
[911]: https://www.jianguoyun.com/p/DV2MIxsQ67buBhjNl1w "Git坚果云地址"
[912]: https://share.weiyun.com/5xfC9Qk "Git微云地址"
[913]: http://wiki.5koon.com/doku.php?id=simplified "iRime说明地址"
[914]: https://pan.baidu.com/s/1uvTbIKwxzJU-Udk4WeDAwQ "键道6RimeWindows小狼毫引导安装包"
[915]: https://pan.baidu.com/s/1BiXlCS4JualOtXvbbTeAQQ "键道6RimeAndroid同文安装包"
[916]: https://739497722.docs.qq.com/ipGva4mn5bo "键道6词库议表"
[917]: http://xkinput.gitee.io/tools/search "键道6查码工具"
[918]: https://gitee.com/all-about-git "各系统git罗列"
[919]: https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/001373962845513aefd77a99f4145f0a2c7a7ca057e7570000 "git入门"
[920]: https://pan.baidu.com/s/1S9ktUAFcqJjjnqovEBSLig "键道6文档"
[921]: https://gitee.com/xkinput/Rime_JD/wikis/pages "键道6wiki文档"
[922]: https://gitee.com/xkinput/Rime_JD/attach_files '附件地址'
[923]: https://gitee.com/xkinput/xkinput/raw/master/public/installJDL.sh '键道6Linux脚本'