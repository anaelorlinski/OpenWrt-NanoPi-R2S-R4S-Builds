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

IMMORTAL_FOLDER=immortal-fresh-master
git clone -b master --single-branch https://github.com/immortalwrt/immortalwrt.git $IMMORTAL_FOLDER
cd $IMMORTAL_FOLDER
git log -1
