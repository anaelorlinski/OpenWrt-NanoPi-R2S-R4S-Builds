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

OPENWRT_FOLDER=openwrt-fresh-master
git clone -b master --single-branch https://git.openwrt.org/openwrt/openwrt.git $OPENWRT_FOLDER
cd $OPENWRT_FOLDER
echo "Current OpenWRT commit"
git log -1

# git go to specific tag if needed
#OPENWRT_TAG=2ce89a35788fcd768a4a872d3d4f5a3a131b1d43
#git reset --hard $OPENWRT_TAG

# note how to freeze feeds too if needed
# see https://github.com/openwrt/openwrt/commit/1d5aa4bde731905073dbfb96d9dfb9b480715505
