<h1 style="text-align:center">星空键道</h1> 

>作者：**吅吅大山** [**键道官网**][904] [加入官方群:320053116][903]

---
#### 目录结构说明：

| 路径 | 作用
| :-------------|:-------------: |
| /Android | 安卓版本[配置文件] |
| /Tools | 扩展码表 |
| /Trime | 同文配置部署文件及安装版apk |
| /Win_Linux_Mac | Win_Linux_Mac [配置文件]及Win_Linux工具|
| /rime | 主码表文件夹 [主码表] |
| README.md | readme.md文件 |

---
#### 使用说明：

#### 安卓：
* 无须下载项目。
* 请可使用[/Trime/][208]中已打包程序，按照其提示安装完成。

#### Windows_Linux_Mac：
* 获取本项目内容：使用一下方法其一
1. [下载][209]本项目。（无法滚动更新）
2. 使用Git程序（可滚动更新）([WindowsGit：下载][905]) ([Linux/Mac Git：自行安装])
* 建议使用git程序，可滚动更新。
* 可使用[/Win_Linux_MAC][210]中内置的工具，执行复制码表就可以。

#### Git简述：
##### 获取项目：
```
#克隆项目到本地
git clone https://gitee.com/nmlixa/Rime_JD
#切换到项目文件夹，添加上游分支地址为 指定地址
cd Rime_JD && git remote add upstream https://gitee.com/nmlixa/Rime_JD.git
```
##### 获取更新：
```
#切换到项目文件夹，获取上游地址的master分支
cd Rime_JD && git pull upstream master
```
##### 发起PR：
```
#创建远程仓库，指向 PR 提交者的仓库
git remote add upstream https://gitee.com/nmlixa/Rime_JD.git
#从该远程仓库拉取代码
git fetch upstream
#将该仓库的某个分支合并到当前分支
git merge upstream/master
#推送到自己的仓库
git push origin master
```
>详见：**[PR教程][906]**

#### 通用操作：
> （须自行下载其操作系统Rime输入法程序，可参考结尾平台总汇）
1. 将[主码表][211] 复制rime文件夹。
2. 将[配置文件][[Android][212]/[Win_Linux_Mac][210]] 复制至rime文件夹。

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
| [Windows(小小)][203] | [Linux(fcitx-rime)][103] | [IOS(iRime)][106]
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
[208]: https://gitee.com/nmlixa/Rime_JD/tree/master/Trime "/Trime"
[209]: https://gitee.com/nmlixa/Rime_JD/repository/archive/master.zip "Download"
[210]: https://gitee.com/nmlixa/Rime_JD/tree/master/Win_Linux_Mac "/Win_Linux_Mac"
[211]: https://gitee.com/nmlixa/Rime_JD/tree/master/rime "/rime"
[212]: https://gitee.com/nmlixa/Rime_JD/tree/master/Android "Android"

[901]: https://gitee.com/thxnder/xxjd/blob/master/doc/xkjd3.md "星空键道 简明教程"
[902]: http://daniushuangpin.ys168.com "吅吅大山的的网盘"
[903]: https://jq.qq.com/?_wv=1027&k=5sTEYIQ "吅吅大山的QQ群"
[904]: http://xkjd.coding.me "键道官网"
[905]: http://gitforwindows.org "WinGit"
[906]: http://www.ruanyifeng.com/blog/2017/07/pull_request.html "阮一峰PR教程"