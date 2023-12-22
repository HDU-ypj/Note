#!/bin/bash

## Download umpl from nexus

# Usage: ./download_ump.sh release-x.x.x
#        ./download_ump.sh develop-x.x.x

PACKEGE_DOMAIN=""
PACKEGE_PATH=""
VERSION=""
if [ $# -ne 1 ]; then
	echo "./download_ump.sh [release|develop]-{version}"
	exit 0
elif [[ $1 == "--help" ]]; then
	echo "./download_ump.sh [release|develop]-{version}"
	exit 0
elif [[ $1 == "release-"* ]]; then
	# splite $1 to get version number
    VERSION=${1#*-}
	echo "download release version $VERSION"
	PACKEGE_PATH="packages-repo"
    PACKEGE_DOMAIN="nexus.ylops.com"
elif [[ $1 == "develop-"* ]]; then
	# splite $1 to get version number
    VERSION=${1#*-}
	echo "download develop version $VERSION"
	PACKEGE_PATH="packages-repo-develop"
    PACKEGE_DOMAIN="nexus.rd.ylops.com"
else
	echo "error param"
	exit 0
fi

echo "---------------Begin download ump---------------"
pwdDir=`pwd`
cd $pwdDir
echo "Working Dir:"$pwdDir

curl -k https://$PACKEGE_DOMAIN/repository/$PACKEGE_PATH/hz/server/ump/$VERSION/linux/amd64/ump.tar.gz -o ump-linux_amd64.tar.gz
curl -k https://$PACKEGE_DOMAIN/repository/$PACKEGE_PATH/hz/server/ump/$VERSION/linux/amd64/ump-asan.tar.gz -o ump-linux_amd64-asan.tar.gz
curl -k https://$PACKEGE_DOMAIN/repository/$PACKEGE_PATH/hz/server/ump/$VERSION/linux/arm64/ump.tar.gz -o ump-linux_arm64.tar.gz
curl -k https://$PACKEGE_DOMAIN/repository/$PACKEGE_PATH/hz/server/ump/$VERSION/linux/arm64/ump-asan.tar.gz -o ump-linux_arm64-asan.tar.gz
curl -k https://$PACKEGE_DOMAIN/repository/$PACKEGE_PATH/hz/server/ump/$VERSION/windows/ump.tar.gz -o ump-windows.tar.gz
curl -k https://$PACKEGE_DOMAIN/repository/$PACKEGE_PATH/hz/server/ump/$VERSION/macos/ump.tar.gz -o ump-macos.tar.gz

if [ -f ump-linux_amd64.tar.gz ]
then
	echo "tar -xzf ump-linux_amd64.tar.gz -C ump-linux_amd64"
	rm -rf ump-linux_amd64
	mkdir ump-linux_amd64
	tar -xzf ump-linux_amd64.tar.gz -C ump-linux_amd64
	echo "rm -f ump-linux_amd64.tar.gz"
	rm -f ump-linux_amd64.tar.gz
fi

if [ -f ump-linux_amd64-asan.tar.gz ]
then
	echo "tar -xzf ump-linux_amd64-asan.tar.gz -C ump-linux_amd64-asan"
	rm -rf ump-linux_amd64-asan
	mkdir ump-linux_amd64-asan
	tar -xzf ump-linux_amd64-asan.tar.gz -C ump-linux_amd64-asan
	echo "rm -f ump-linux_amd64-asan.tar.gz"
	rm -f ump-linux_amd64-asan.tar.gz
fi

if [ -f ump-linux_arm64.tar.gz ]
then
	echo "tar -xzf ump-linux_arm64.tar.gz -C ump-linux_arm64"
	rm -rf ump-linux_arm64
	mkdir ump-linux_arm64
	tar -xzf ump-linux_arm64.tar.gz -C ump-linux_arm64
	echo "rm -f ump-linux_arm64.tar.gz"
	rm -f ump-linux_arm64.tar.gz
fi

if [ -f ump-linux_arm64-asan.tar.gz ]
then
	echo "tar -xzf ump-linux_arm64-asan.tar.gz -C ump-linux_arm64-asan"
	rm -rf ump-linux_arm64-asan
	mkdir ump-linux_arm64-asan
	tar -xzf ump-linux_arm64-asan.tar.gz -C ump-linux_arm64-asan
	echo "rm -f ump-linux_arm64-asan.tar.gz"
	rm -f ump-linux_arm64-asan.tar.gz
fi

if [ -f ump-windows.tar.gz ]
then
	echo "tar -xzf ump-windows.tar.gz -C ump-windows"
	rm -rf ump-windows
	mkdir ump-windows
	tar -xzf ump-windows.tar.gz -C ump-windows
	echo "rm -f ump-windows.tar.gz"
	rm -f ump-windows.tar.gz
fi

if [ -f ump-macos.tar.gz ]
then
	echo "tar -xzf ump-macos.tar.gz -C ump-macos"
	rm -rf ump-macos
	mkdir ump-macos
	tar -xzf ump-macos.tar.gz -C ump-macos
	echo "rm -f ump-macos.tar.gz"
	rm -f ump-macos.tar.gz
fi

echo "/usr/bin/cp -rf ump-linux_amd64/ump/include/* ./vendors/umpl/interface"
/usr/bin/cp -rf ump-linux_amd64/ump/include/* ./vendors/umpl/interface

echo "/usr/bin/cp -rf ump-linux_amd64/ump/libs/* ./vendors/umpl/lib/amd64-linux/"
/usr/bin/cp -rf ump-linux_amd64/ump/libs/* ./vendors/umpl/lib/amd64-linux/
echo "/usr/bin/cp -rf ump-linux_arm64/ump/libs/* ./vendors/umpl/lib/arm64-linux/"
/usr/bin/cp -rf ump-linux_arm64/ump/libs/* ./vendors/umpl/lib/arm64-linux/

echo "/usr/bin/cp -rf ump-linux_amd64-asan/ump-asan/libs/* ./vendors/umpl/lib/amd64-linux-asan/"
/usr/bin/cp -rf ump-linux_amd64-asan/ump-asan/libs/* ./vendors/umpl/lib/amd64-linux-asan/
echo "/usr/bin/cp -rf ump-linux_arm64-asan/ump-asan/libs/* ./vendors/umpl/lib/arm64-linux-asan/"
/usr/bin/cp -rf ump-linux_arm64-asan/ump-asan/libs/* ./vendors/umpl/lib/arm64-linux-asan/

echo "/usr/bin/cp -rf ump-windows/ump/libs/x86/Release/* ./vendors/umpl/lib/win32/release/"
/usr/bin/cp -rf ump-windows/ump/libs/x86/Release/* ./vendors/umpl/lib/win32/release/
echo "/usr/bin/cp -rf ump-windows/ump/libs/x86/Debug/* ./vendors/umpl/lib/win32/debug/"
/usr/bin/cp -rf ump-windows/ump/libs/x86/Debug/* ./vendors/umpl/lib/win32/debug/

echo "/usr/bin/cp -rf ump-windows/ump/libs/x64/Release/* ./vendors/umpl/lib/x86_64/release/"
/usr/bin/cp -rf ump-windows/ump/libs/x64/Release/* ./vendors/umpl/lib/x86_64/release/
echo "/usr/bin/cp -rf ump-windows/ump/libs/x64/Debug/* ./vendors/umpl/lib/x86_64/debug/"
/usr/bin/cp -rf ump-windows/ump/libs/x64/Debug/* ./vendors/umpl/lib/x86_64/debug/

echo "/usr/bin/cp -rf ump-macos/ump/lib/release/x86_64/* ./vendors/umpl/lib/mac/release/x86_64/"
/usr/bin/cp -rf ump-macos/ump/lib/release/x86_64/* ./vendors/umpl/lib/mac/release/x86_64/
echo "/usr/bin/cp -rf ump-macos/ump/lib/release/arm64/* ./vendors/umpl/lib/mac/release/arm64/"
/usr/bin/cp -rf ump-macos/ump/lib/release/arm64/* ./vendors/umpl/lib/mac/release/arm64/

echo "/usr/bin/cp -rf ump-macos/ump/lib/debug/x86_64/* ./vendors/umpl/lib/mac/debug/x86_64/"
/usr/bin/cp -rf ump-macos/ump/lib/debug/x86_64/* ./vendors/umpl/lib/mac/debug/x86_64/
echo "/usr/bin/cp -rf ump-macos/ump/lib/debug/arm64/* ./vendors/umpl/lib/mac/debug/arm64/"
/usr/bin/cp -rf ump-macos/ump/lib/debug/arm64/* ./vendors/umpl/lib/mac/debug/arm64/

echo "/usr/bin/cp -rf ump-macos/ump/lib_asan/release/x86_64/* ./vendors/umpl/lib/mac-asan/release/x86_64/"
/usr/bin/cp -rf ump-macos/ump/lib_asan/release/x86_64/* ./vendors/umpl/lib/mac-asan/release/x86_64/
echo "/usr/bin/cp -rf ump-macos/ump/lib_asan/release/arm64/* ./vendors/umpl/lib/mac-asan/release/arm64/"
/usr/bin/cp -rf ump-macos/ump/lib_asan/release/arm64/* ./vendors/umpl/lib/mac-asan/release/arm64/

echo "/usr/bin/cp -rf ump-macos/ump/lib_asan/debug/x86_64/* ./vendors/umpl/lib/mac-asan/debug/x86_64/"
/usr/bin/cp -rf ump-macos/ump/lib_asan/debug/x86_64/* ./vendors/umpl/lib/mac-asan/debug/x86_64/
echo "/usr/bin/cp -rf ump-macos/ump/lib_asan/debug/arm64/* ./vendors/umpl/lib/mac-asan/debug/arm64/"
/usr/bin/cp -rf ump-macos/ump/lib_asan/debug/arm64/* ./vendors/umpl/lib/mac-asan/debug/arm64/

echo "rm -rf ump-linux_amd64"
rm -rf ump-linux_amd64
echo "rm -rf ump-linux_amd64-asan"
rm -rf ump-linux_amd64-asan
echo "rm -rf ump-linux_arm64"
rm -rf ump-linux_arm64
echo "rm -rf ump-linux_arm64-asan"
rm -rf ump-linux_arm64-asan
echo "rm -rf ump-windows"
rm -rf ump-windows
echo "rm -rf ump-macos"
rm -rf ump-macos

echo "---------------Finished download ump---------------"