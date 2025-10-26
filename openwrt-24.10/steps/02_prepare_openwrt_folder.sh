#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

cp -R openwrt-fresh-24.10 openwrt

# freeze revision to 24.10.4
cd openwrt
git reset --hard 78b23a26c4c98938d549e7ff5876508544e33d4d
# patch telephony feed to include last patch (remove after 24.10.4)
sed -i 's/2a4541d46199ac96fac214d02c908402831c4dc6/11e9c73bff6be34ff2fdcd4bc0e81a4723d78652/g' feeds.conf.default

echo "Current OpenWRT commit"
git log -1
git describe

# install feeds
# cd openwrt
# ./scripts/feeds update -a && ./scripts/feeds install -a

