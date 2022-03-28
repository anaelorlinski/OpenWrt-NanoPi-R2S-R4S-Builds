#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

# install feeds
cd openwrt

/bin/bash $ROOTDIR/openwrt-22.03/steps/create_acl_for_luci.sh -a