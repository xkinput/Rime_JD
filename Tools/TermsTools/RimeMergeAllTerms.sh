#!/bin/bash
if [ ! -f "./xkjd6.dict.yaml" ];then
  echo "将创建词库文件"
else
  rm -rf ./xkjd6.dict.yaml
  echo "删除旧词库文件"
fi

if [ ! -f "../../rime/xkjd6.danzi.dict.yaml" ];then
  echo "合并单字失败"
else
  cat ../../rime/xkjd6.danzi.dict.yaml >> ./xkjd6.dict.yaml
  echo "合并单字  OK"
fi

if [ ! -f "../../rime/xkjd6.wxw.dict.yaml" ];then
  echo "合并声笔失败"
else
  cat ../../rime/xkjd6.wxw.dict.yaml >> ./xkjd6.dict.yaml
  echo "合并声笔  OK"
fi

if [ ! -f "../../rime/xkjd6.cizu.dict.yaml" ];then
  echo "合并词组失败"
else
  cat ../../rime/xkjd6.cizu.dict.yaml >> ./xkjd6.dict.yaml
  echo "合并词组  OK"
fi

if [ ! -f "../../rime/xkjd6.buchong.dict.yaml" ];then
  echo "合并补充失败"
else
  cat ../../rime/xkjd6.buchong.dict.yaml >> ./xkjd6.dict.yaml
  echo "合并补充  OK"
fi

if [ ! -f "../../rime/xkjd6.chaojizici.dict.yaml" ];then
  echo "合并超级字词失败"
else
  cat ../../rime/xkjd6.chaojizici.dict.yaml >> ./xkjd6.dict.yaml
  echo "合并超级字词  OK"
fi

if [ ! -f "../../rime/xkjd6.yingwen.dict.yaml" ];then
  echo "合并英文失败"
else
  cat ../../rime/xkjd6.yingwen.dict.yaml >> ./xkjd6.dict.yaml
  echo "合并英文  OK"
fi

if [ ! -f "../../rime/xkjd6.biaodian.dict.yaml" ];then
  echo "合并标点失败"
else
  cat ../../rime/xkjd6.biaodian.dict.yaml >> ./xkjd6.dict.yaml
  echo "合并标点  OK"
fi

if [ ! -f "../../rime/xkjd6.fuhao.dict.yaml" ];then
  echo "合并符号失败"
else
  cat ../../rime/xkjd6.fuhao.dict.yaml >> ./xkjd6.dict.yaml
  echo "合并符号  OK"
fi

if [ ! -f "../../rime/xkjd6.lianjie.dict.yaml" ];then
  echo "合并链接失败"
else
  cat ../../rime/xkjd6.lianjie.dict.yaml >> ./xkjd6.dict.yaml
  echo "合并链接  OK"
fi

if [ $(uname) == "Darwin" ];then

  sed -i '' -E $'/---/,/\\.\\.\\./d' ./xkjd6.dict.yaml
  echo "去除各头信息 OK"
  sed -i '' -E $'1 i\\\n---\\\nname: xkjd6\\\nversion: "Q1"\\\nsort: original\\\n...\\\n' ./xkjd6.dict.yaml

else

  sed -i ":a;N;s/\n*---\n*//g;ta" ./xkjd6.dict.yaml
  sed -i ":a;N;s/\n*\.\.\.\n*//g;ta" ./xkjd6.dict.yaml
  sed -i ":a;N;s/\n*name:\s.*\n*//g;ta" ./xkjd6.dict.yaml
  sed -i ":a;N;s/\n*version:\s.*\n*//g;ta" ./xkjd6.dict.yaml
  sed -i ":a;N;s/\n*sort:\s.*\n*//g;ta" ./xkjd6.dict.yaml
  echo "去除各头信息 OK"

  sed -i '1i ---\nname: xkjd6\nversion: "Q1"\nsort: original\n...' ./xkjd6.dict.yaml

fi

echo "添加头信息 OK"
