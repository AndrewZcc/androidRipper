#!/bin/bash

source ~/.profile

echo "\nAndroidRipper: Information Collector"
echo "[Usage: sh collectInfo.sh AUT_Dir AUT_PackName]\n"
# eg. sh collectInfo.sh net.fercanet.LNM_3_src net.fercanet.LNM

if [ $# != 2 ]; then
	echo "[Parameters Number Error]"
	echo "[Usage: sh collectInfo.sh AUT_Dir AUT_PackName]"
	exit 1
fi

AUT_Dir=$1
AUT_PackageName=$2

echo "--------------------"
echo "Copy ec directory (files)"
echo "Copy ==> ""/data/data/"$AUT_PackageName"/"
rm -rf "./aut_coverage/"$AUT_Dir 		# 先清空原有数据
mkdir -p "./aut_coverage/"$AUT_Dir 		# 再重新创建目录拷贝新数据
adb pull "/data/data/"$AUT_PackageName"/" "./aut_coverage/"$AUT_Dir"/"

echo "\n--------------------"
echo "Copy em file"
echo "Copy ==> /subjects/"$AUT_Dir"/bin/coverage.em"
cp "../../subjects/"$AUT_Dir"/bin/coverage.em" "./aut_coverage/"$AUT_Dir"/"

echo "\n--------------------"
echo "END ..."