#!/bin/bash

# 第一个参数是 release or develop
# 第二个参数是版本号

PACKEGE_PATH=""
if [ $# -ne 2 ]; then
	echo "./download_ma.sh [release|develop] version_number"
	exit 0
elif [[ $1 == "--help" ]]; then
	echo "./download_ma.sh [release|develop] version_number"
	exit 0
elif [[ $1 == "develop" ]]; then
	echo "download develop version..."
	PACKEGE_PATH="packages-repo-develop"
elif [[ $1 == "release" ]]; then
	echo "download release version..."
	PACKEGE_PATH="packages-repo"
else
	echo "error param"
	exit 0
fi

echo "---------------Begin download ma_hw---------------"
pwdDir=`pwd`
cd $pwdDir
echo "Working Dir:"$pwdDir

curl -k https://nexus.ylops.com/repository/${PACKEGE_PATH}/public/media/ma-hw/$2/linux/amd64/ma-hw.tar.gz -o ma-hw-linux_amd64.tar.gz
curl -k https://nexus.ylops.com/repository/${PACKEGE_PATH}/public/media/ma-hw/$2/linux/arm64/ma-hw.tar.gz -o ma-hw-linux_arm64.tar.gz
curl -k https://nexus.ylops.com/repository/${PACKEGE_PATH}/public/media/ma-hw/$2/windows/ma-hw.tar.gz -o ma-hw-windows.tar.gz


if [ -f ma-hw-linux_amd64.tar.gz ]
then
	echo "tar -xzf ma-hw-linux_amd64.tar.gz -C ma-hw-linux_amd64"
	rm -rf ma-hw-linux_amd64
	mkdir ma-hw-linux_amd64
	tar -xzf ma-hw-linux_amd64.tar.gz -C ma-hw-linux_amd64
	echo "rm -f ma-hw-linux_amd64.tar.gz"
	rm -f ma-hw-linux_amd64.tar.gz
fi

if [ -f ma-hw-linux_arm64.tar.gz ]
then
	echo "tar -xzf ma-hw-linux_arm64.tar.gz -C ma-hw-linux_arm64"
	rm -rf ma-hw-linux_arm64
	mkdir ma-hw-linux_arm64
	tar -xzf ma-hw-linux_arm64.tar.gz -C ma-hw-linux_arm64
	echo "rm -f ma-hw-linux_arm64.tar.gz"
	rm -f ma-hw-linux_arm64.tar.gz
fi

if [ -f ma-hw-windows.tar.gz ]
then
	echo "tar -xzf ma-hw-windows.tar.gz -C ma-hw-windows"
	rm -rf ma-hw-windows
	mkdir ma-hw-windows
	tar -xzf ma-hw-windows.tar.gz -C ma-hw-windows
	echo "rm -f ma-hw-windows.tar.gz"
	rm -f ma-hw-windows.tar.gz
fi

echo "/usr/bin/cp -rf ma-hw-linux_amd64/ma-hw/include/* ./vendors/hw_acc/api/"
/usr/bin/cp -rf ma-hw-linux_amd64/ma-hw/include/* ./vendors/ma-hw/include/

echo "/usr/bin/cp -rf ma-hw-linux_amd64/ma-hw/libs/*.so ./vendors/ma-hw/libs/amd64-linux/"
/usr/bin/cp -rf ma-hw-linux_amd64/ma-hw/libs/*.so ./vendors/ma-hw/libs/amd64-linux/
echo "/usr/bin/cp -rf ma-hw-linux_amd64/ma-hw/libs/vendors/* ./vendors/ma-hw/libs/amd64-linux/"
/usr/bin/cp -rf ma-hw-linux_amd64/ma-hw/libs/vendors/* ./vendors/ma-hw/libs/amd64-linux/
echo "/usr/bin/cp -rf ma-hw-linux_arm64/ma-hw/libs/*.so ./vendors/ma-hw/libs/arm64-linux/"
/usr/bin/cp -rf ma-hw-linux_arm64/ma-hw/libs/*.so ./vendors/ma-hw/libs/arm64-linux/
echo "/usr/bin/cp -rf ma-hw-windows/ma-hw/libs/Release/*dll ./vendors/ma-hw/libs/win/release/"
/usr/bin/cp -rf ma-hw-windows/ma-hw/libs/Release/*dll ./vendors/ma-hw/libs/win/release/
echo "/usr/bin/cp -rf ma-hw-windows/ma-hw/libs/Release/*.lib ./vendors/ma-hw/libs/win/release/"
/usr/bin/cp -rf ma-hw-windows/ma-hw/libs/Release/*.lib ./vendors/ma-hw/libs/win/release/
echo "/usr/bin/cp -f ma-hw-windows/ma-hw/libs/Release/*.pdb ./vendors/ma-hw/libs/win/release/"
/usr/bin/cp -f ma-hw-windows/ma-hw/libs/Release/*.pdb ./vendors/ma-hw/libs/win/release/
echo "/usr/bin/cp -rf ma-hw-windows/ma-hw/libs/Debug/*dll ./vendors/ma-hw/libs/win/debug/"
/usr/bin/cp -rf ma-hw-windows/ma-hw/libs/Debug/*dll ./vendors/ma-hw/libs/win/debug/
echo "/usr/bin/cp -rf ma-hw-windows/ma-hw/libs/Debug/*.lib ./vendors/ma-hw/libs/win/debug/"
/usr/bin/cp -rf ma-hw-windows/ma-hw/libs/Debug/*.lib ./vendors/ma-hw/libs/win/debug/
echo "/usr/bin/cp -f ma-hw-windows/ma-hw/libs/Debug/*.pdb ./vendors/ma-hw/libs/win/debug/"
/usr/bin/cp -f ma-hw-windows/ma-hw/libs/Debug/*.pdb ./vendors/ma-hw/libs/win/debug/

echo "rm -rf ma-hw-linux_amd64"
rm -rf ma-hw-linux_amd64
echo "rm -rf ma-hw-linux_arm64"
rm -rf ma-hw-linux_arm64
echo "rm -rf ma-hw-windows"
rm -rf ma-hw-windows

echo "---------------Finished download ma-hw---------------"