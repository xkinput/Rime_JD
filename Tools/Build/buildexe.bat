@echo off
if exist "..\SystemTools\WindowsTools\备份" (
  mkdir "..\..\..\备份"
  xcopy "..\SystemTools\WindowsTools\备份" "..\..\..\备份" /y /e
  echo 用户词库备份完成
  rmdir /S /Q "..\SystemTools\WindowsTools\备份"
)

if exist "Rime_JD.7z" (
  del Rime_JD.7z /S /Q
  echo 删除旧文件
)

if exist "Rime_JD.exe" (
  del Rime_JD.exe /S /Q
  echo 删除旧文件
)


echo 开始构建7zip
7z a -m1=LZMA Rime_JD.7z ..\..\