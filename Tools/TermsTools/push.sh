#!/bin/bash
git add . ../../rime/*

read -p "请输入更新依据: [默认：据议表更新词库]" upgradeOrigin
if [ -z $upgradeOrigin ];then
  git commit -m "更新：据议表更新词库"
else
  git commit -m "更新：$upgradeOrigin更新词库"
fi

git push origin master

