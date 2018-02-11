clear
Get_SysPack_Name(){
    if grep -Eqii "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
        DISTRO='CentOS'
        PM='yum'
    elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
        DISTRO='RHEL'
        PM='yum'
    elif grep -Eqi "Arch" /etc/issue || grep -Eq "Arch" /etc/*-release; then
        DISTRO='Aliyun'
        PM='pacman'
    elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
        DISTRO='Aliyun'
        PM='yum'
    elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
        DISTRO='Fedora'
        PM='yum'
    elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
        DISTRO='Debian'
        PM='apt'
    elif grep -Eqi "Deepin" /etc/issue || grep -Eq "Deepin" /etc/*-release; then
        DISTRO='Deepin'
        PM='apt'
    elif grep -Eqi "Manjaro" /etc/issue || grep -Eq "Deepin" /etc/*-release; then
        DISTRO='Manjaro'
        PM='pacman'
    elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        DISTRO='Ubuntu'
        PM='apt'
    elif grep -Eqi "Linuxmint" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
        DISTRO='Linuxmint'
        PM='apt'
    else
        DISTRO='当前不支持你的系统'
    fi
	echo "==========================================="
    echo "*当前系统为"$DISTRO"，将执行"$PM"安装方法。";
	echo "==========================================="
}
Get_SysPack_Name
sleep 3
clear
NAME=../rime/name.txt
echo "==========================================="
echo "欢迎使用Linux_Rime输入法Fcitx-rime引导程序"
echo "==========================================="
echo "                 `cat $NAME`"
echo "向导："
echo "请在有网络环境下开始，否则请立即Ctrl+c停止！"
echo "若在无网络情况下卸载输入法，将无法安装输入法"
echo "安装分为4步："
echo "1、卸载旧版Fcitx程序。"
echo "2、安装Fcitx程序。"
echo "3、复制Rime用户配置文件。"
echo "4、注销或重启系统。"
echo "*过程可能较慢，请耐心等待。"
echo "                          shell by Qshu"
echo "==========================================="
echo "*请阅读向导，8秒后开始安装……"
if [ ! -d "../rime" ]; then
	clear
	echo "==========================================="
	echo ""
	echo "            未找到rime文件夹！"
	echo ""
	echo ""
	echo "请下载rime文件放至安装器目录再继续安装。"
	echo "==========================================="
	sleep 5
	exit
fi
sleep 8
clear
echo "==========================================="
echo "欢迎使用Linux_Rime输入法Fcitx-rime引导程序"
echo "==========================================="
echo "第一步 卸载系统Fcitx程序"
echo "==========================================="
echo "请输入Root用户密码："
RemoveOldFcitx(){
	if [ $PM = "apt" ]; then
		sudo apt-get remove fcitx* -y
	elif [ $PM = "yum" ]; then
		sudo yum remove fcitx* -y
	elif [ $PM = "pacman" ]; then
		sudo pacman -Rs fcitx* -y
	fi
}
RemoveOldFcitx
sleep 5
clear
echo "==========================================="
echo "欢迎使用LinuxRime输入法Fcitx-rime引导程序"
echo "==========================================="
echo "第二步 安装系统Fcitx程序"
echo "==========================================="
sleep 1
InstallFcitx(){
	if [ $PM = "apt" ]; then
		sudo apt install fcitx fcitx-rime fcitx-ui-classic fcitx-config-gtk -y
	elif [ $PM = "yum" ]; then
		sudo yum install fcitx fcitx-rime fcitx-ui-classic fcitx-config-gtk -y
	elif [ $PM = "pacman" ]; then
		sudo pacman -S fcitx fcitx-rime fcitx-ui-classic fcitx-config-gtk -y
	fi
}
InstallFcitx
sleep 5
clear
echo "==========================================="
echo "欢迎使用LinuxRime输入法Fcitx-rime引导程序"
echo "==========================================="
echo "第三步 复制Rime用户配置文件"
echo "==========================================="
rm -rf ~/.config/fcitx/rime
echo "已清空配置文件目录"
cp -r ../../rime ~/.config/fcitx
cp -r ../rime ~/.config/fcitx
rm -rf ~/.config/fcitx/rime/Windows
echo "已复制文件"
echo "==========================================="
clear
echo "预览 ~/.config/fcitx/rime/"
echo "==========================================="
ls ~/.config/fcitx/rime/
echo "==========================================="
sleep 1
clear
echo "==========================================="
echo "已完成安装"
echo "==========================================="
sleep 1
clear
echo "==========================================="
echo "欢迎使用LinuxRime输入法Fcitx-rime引导程序"
echo "==========================================="
echo " 注销 或 重启 系统后即可使用"
echo "==========================================="
echo "是否重启系统？"
sleep 1
echo "8秒后将重启系统，若不想重启系统请Ctrl + C停止"
echo "==========================================="
sleep 1
echo "已完成安装"
sleep 8
sudo reboot
