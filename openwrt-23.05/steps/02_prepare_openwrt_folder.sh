#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

cp -R openwrt-fresh-23.05 openwrt

# freeze revision to 23.05.3
cd openwrt
git reset --hard 01170d518da1c8ade9d26e56d0135d12cda8e781

echo "Current OpenWRT commit"
git log -1
git describe

# install feeds
# cd openwrt
# ./scripts/feeds update -a && ./scripts/feeds install -a

