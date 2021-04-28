#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

cp -R openwrt-fresh-2102 openwrt

# install feeds
cd openwrt
./scripts/feeds update -a && ./scripts/feeds install -a

