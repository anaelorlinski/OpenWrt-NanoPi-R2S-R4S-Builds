#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

BUILDDIR="$ROOTDIR/build"
SCRIPTDIR=$(dirname $(readlink -f $0))

if [ ! -e "$BUILDDIR/openwrt-fresh-master" ]; then
    echo "Please run from root / no openwrt-fresh-master ! please clone first"
    exit 1
fi

rm -rf $ROOTDIR/package/uboot-rockchip
cp -R $BUILDDIR/openwrt-fresh-master/package/boot/uboot-rockchip $ROOTDIR/package/uboot-rockchip
