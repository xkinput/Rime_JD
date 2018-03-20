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
echo "==========================================="
echo "欢迎使用Linux_Rime输入法Fcitx-rime引导程序"
echo "==========================================="
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
echo "*请阅读向导，5秒后开始安装……"
sleep 5
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
JDL=""
YB=""
LB=""
fcitx=~/.config/fcitx
rime=~/.config/fcitx/rime
if [ ! -d "./备份" ]; then
	clear
	mkdir 备份
else
	rm -rf 备份/*
fi

if [ ! -f "$rime/default.yaml" ]; then
	echo "无需备份"
else
	cp -rf "$rime"/* ./备份/
	echo "备份“用户文件夹”到“备份”文件夹	完成"
fi
sleep 1
rm -rf "$rime"
echo "清空配置文件目录					完成"
clear
echo "检测到键道6词库，是否同时安装？ y/n"
read isInstall
if [ "$isInstall" = "y" ] || [ "$isInstall" = "Y" ]; then
	cp -rf ../../rime "$fcitx"
	echo "复制Rime用户码表文件				完成"
	cp -rf ../rime/*.yaml "$rime"
	echo "复制Rime用户配置文件				完成"
	echo "复制所有文件					完成"
	JDL="键道6"
else
	echo "已拒绝安装。"
fi
sleep 1
rime_xklb="../../../rime_xklb";
if [ ! -d "$rime_xklb" ]; then
	echo "没有两笔词库，跳过。"
else
	echo "检测到两笔词库，是否同时安装？ y/n"
	read isInstall
	if [ "$isInstall" = "y" ] || [ "$isInstall" = "Y" ]; then
		cp -rf "$rime_xklb/rime" "$fcitx"
		echo "复制码表完成					完成"
		echo "复制所有文件					完成"
		LB="星空两笔"
	else
		echo "已拒绝安装。"
	fi
fi
sleep 1
rime_xkyb="../../../rime_xkyb";
if [ ! -d "$rime_xkyb" ]; then
	echo "没有一笔词库，跳过。"
else
	echo "检测到一笔词库，是否同时安装？ y/n"
	read isInstall
	if [ "$isInstall" = "y" ] || [ "$isInstall" = "Y" ]; then
		cp -rf "$rime_xkyb/rime" "$fcitx"
		echo "复制码表完成					完成"
		echo "复制所有文件					完成"
		YB="星空一笔"
	else
		echo "已拒绝安装。"
	fi
fi
if [ ! -d "$rime" ]; then
	echo ""
else
	cp -rf ../*.yaml "$rime"
	echo "全局配置文件						完成"
fi
sleep 1
clear
echo "预览 $rime/"
echo "==========================================="
ls "$rime"
echo "==========================================="
sleep 2
clear
echo "==========================================="
echo "已安装方案： $JDL $YB $LB"
echo "请在fcitx重新部署后再尝试使用。"
echo "==========================================="
sleep 2
clear
echo " 注销 或 重启 系统后即可使用"
echo "==========================================="
echo "8秒后重启，若不想重启系统请Ctrl+C，并且手动注销"
echo "==========================================="
sleep 8
sudo reboot
