#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

cp -R openwrt-fresh-22.03 openwrt

# freeze revision to 22.03.4
cd openwrt
git reset --hard 94adc23fa693d1b129ce1718573dfb12594f20f8

echo "Current OpenWRT commit"
git log -1
git describe

# install feeds
# cd openwrt
# ./scripts/feeds update -a && ./scripts/feeds install -a

