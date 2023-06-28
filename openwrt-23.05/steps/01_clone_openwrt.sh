#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/LICENSE" ]; then
    echo "Please run from root"
    exit 1
fi

cd $ROOTDIR
mkdir build
cd build

OPENWRT_FOLDER=openwrt-fresh-23.05

git clone -b openwrt-23.05 --single-branch https://git.openwrt.org/openwrt/openwrt.git $OPENWRT_FOLDER
#git clone --single-branch https://git.openwrt.org/openwrt/openwrt.git $OPENWRT_FOLDER

cd $OPENWRT_FOLDER
echo "Current OpenWRT commit"
git log -1
