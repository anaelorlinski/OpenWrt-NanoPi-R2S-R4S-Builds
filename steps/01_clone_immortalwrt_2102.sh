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

IMMORTAL_FOLDER=immortal-fresh-2102
git clone -b openwrt-21.02 --depth 1 https://github.com/immortalwrt/immortalwrt.git $IMMORTAL_FOLDER
cd $IMMORTAL_FOLDER
git log -1
