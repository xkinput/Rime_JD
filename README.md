### 通知：PR注意，若上游更新内容含有“缩减仓库”，请在push代码前pull rebasel 详见：[缩减仓库说明][908]

<h1 style="text-align:center"><center>星空键道</center></h1> 

>作者：**吅吅大山** [**键道官网**][904] [加入官方群:320053116][903]

---
#### 目录结构说明：

| 路径 | 作用
| :-------------|:-------------: |
| /Extended | 扩展码表 |
| /SystemTools | 各系统配置文件工具]|
| /rime | 主码表文件夹 [主码表] |
| README.md | readme.md文件 |

---
#### 使用说明：

#### 安卓：
* 无须下载项目。
* 请可使用[发布版][208]已打包程序，按照其提示安装完成。
* “同文星空”中（一笔、两笔）为大牛群中 工藤新一（经常改名）大佬所维护Rime码表内容。

同文输入法：

![同文输入效果](https://gitee.com/uploads/images/2018/0202/192524_07b99b96_1362709.jpeg "同文.jpg")

#### 其他系统平台：
* 获取本项目内容：使用一下方法其一
1. [下载][209]本项目。（无法滚动更新）
2. 使用Git程序（可滚动更新）([WindowsGit：下载安装][905]) ([Linux/Mac Git：自行安装])
* 建议使用git程序，可滚动更新。
* 可使用[/SystemTools][210]中各系统的工具，执行复制码表就可以。

小狼毫：

![小狼毫输入效果](https://gitee.com/uploads/images/2018/0202/192157_9ce8b742_1362709.png "小狼毫.png")

Fcitx-rime：

![Fcitx-rime输入效果](https://gitee.com/uploads/images/2018/0203/225102_eb77f6dc_1362709.png "Fcitx-rime.png")

鼠须管：

![鼠须管输入效果](https://gitee.com/uploads/images/2018/0208/175654_2f566986_1362709.png "鼠须管.png")
#### Git简述：
##### 获取项目：
```
#克隆项目到本地
git clone https://gitee.com/nmlixa/Rime_JD
#切换到项目文件夹
cd Rime_JD
#添加上游分支地址为 指定地址
git remote add upstream https://gitee.com/nmlixa/Rime_JD.git
```
##### 获取更新：
```
#获取上游地址的master分支
git pull upstream master
#若提示“fatal: refusing to merge unrelated histories”请使用
git pull upstream master --allow-unrelated-histories
#Git获取后，执行复制码表工具，再重新部署
```
##### 可选）发起PR：
```
#若你有意发起扩展词库，或者提交词可用Git提交，提交后合理将直接合并到仓库内

#创建远程仓库，指向 PR 提交者的仓库
git remote add upstream https://gitee.com/nmlixa/Rime_JD.git
#从该远程仓库拉取代码
git fetch upstream
**如果上游更新内容含有 缩减仓库历史，请在push 代码前 pull rebasel 详见：缩减仓库说明**
#将该仓库的上游分支合并到自己分支
git merge upstream
#推送到自己的仓库
git push origin master
```
```
提交commit规范：
码表类：
码表分类：[据议表调整： x个] 外加调整：词组 编码... x个
工具类：
Linux：工具名 文件名 纠错/添加/删除
Windows：工具名 文件名 纠错/添加/删除
```
>详见：**[git-简明指南][909] [码云PR教程][907] [博客PR教程][906] [缩减仓库说明][908]**

#### 通用操作：
> （须自行下载其操作系统Rime输入法程序，可参考结尾平台总汇）
1. 将[主码表][211] 复制rime文件夹。
2. 将[配置文件][[Android][212]/[SystemTools/[system]][210]] 复制至rime文件夹。

#### 最后：
> 重新部署，并尝试输入文字。安装完成。

#### 扩展说明：
1. 扩展控制文件为 xkjd6.extended.dict.yaml / xkjd6dz.extended.dict.yaml
2. 文件中有详细说明。

#### 分支说明：
> master为定期更新稳定内容。
---
### 第三方维护版本：

| RIME | RIME正體字碼表 | 小小 | 
| ------------- |:-------------:|:-------------:|
| [Qshu][204] | [岳飞丫飞][207] | [thxnder][206] |
| [主页][204] | [主页][207] | [主页][205] |
---
### 键道可以运行在以下平台中

| Windows | Linux | Apple | Android
| ------------- |:-------------:|:-------------:|:-----:
| [Windows(weasel)][101] | [Linux(ibus-rime)][104] | [Mac(squirrel)][102] | [Android(trime)][105] 
| [Windows(小小)][203] | [Linux(fcitx-rime)][103] | [IOS(iRime)][106] | [Android(小小)][203]
| [Windows(多多)][108] | [Linux(小小)][203] | [IOS(落格)][107]


> 键道的跨平台使用离不开以上优秀的输入平台

[998]: https://gitee.com/thxnder/xxjd/tree/master/release "新版本小小键道"
[999]: https://gitee.com/nmlixa/Rime_JD "新版本RIME键道"

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
[204]: https://gitee.com/nmlixa/Rime_JD "Rime键道主页"
[205]: http://xxjd.xyz "小小键道主页"
[206]: https://gitee.com/thxnder "「小小键道」 维护者"
[207]: https://gitee.com/lyserenity/xkjd6 "正体字码表"
[208]: https://gitee.com/nmlixa/Rime_JD/releases "发行页"
[209]: https://gitee.com/nmlixa/Rime_JD/repository/archive/master.zip "Download"
[210]: https://gitee.com/nmlixa/Rime_JD/tree/master/SystemTools "/SystemTools"
[211]: https://gitee.com/nmlixa/Rime_JD/tree/master/rime "/rime"
[212]: https://gitee.com/nmlixa/Rime_JD/tree/master/SystemTools/Android "Android"

[901]: https://gitee.com/thxnder/xxjd/blob/master/doc/xkjd3.md "星空键道 简明教程"
[902]: http://daniushuangpin.ys168.com "吅吅大山的的网盘"
[903]: https://jq.qq.com/?_wv=1027&k=5sTEYIQ "吅吅大山的QQ群"
[904]: http://xkjd.coding.me "键道官网"
[905]: https://git-scm.com/ "Git"
[906]: http://www.ruanyifeng.com/blog/2017/07/pull_request.html "阮一峰PR教程"
[907]: http://git.mydoc.io/?t=180700 "码云PR教程"
[908]: http://git.mydoc.io/?t=83153 "码云缩减仓库说明"
[909]: http://rogerdudler.github.io/git-guide/index.zh.html "git - 简明指南"