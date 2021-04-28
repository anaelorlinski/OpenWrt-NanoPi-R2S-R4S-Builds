#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

BUILDDIR="$ROOTDIR/build"
SCRIPTDIR=$(dirname $(readlink -f $0))

if [ ! -e "$BUILDDIR/immortal-fresh-master" ]; then
    echo "Please run from root / no immortal-fresh-master ! please clone first"
    exit 1
fi

rm -rf $ROOTDIR/package/uboot-rockchip
cp -R $BUILDDIR/immortal-fresh-master/package/boot/uboot-rockchip $ROOTDIR/package/uboot-rockchip

# use custom makefile, so there is no need of arm-trusted-firmware-rk3288
# and use generic version arm-trusted-firmware-rockchip
cp $SCRIPTDIR/data/uboot/Makefile $ROOTDIR/package/uboot-rockchip/Makefile
