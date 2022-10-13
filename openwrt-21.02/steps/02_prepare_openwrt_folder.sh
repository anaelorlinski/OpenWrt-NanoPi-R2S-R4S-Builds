#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

cp -R openwrt-fresh-2102 openwrt

# freeze revision to 21.02.4
cd openwrt
git reset --hard 66ee6c223193d08e5d8d6a903edbe393ffd945ce

echo "Current OpenWRT commit"
git log -1
git describe

# install feeds
# cd openwrt
# ./scripts/feeds update -a && ./scripts/feeds install -a

