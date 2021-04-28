#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

cd openwrt
cp $ROOTDIR/seed/ao.seed .config
make defconfig
cp .config  ao.config