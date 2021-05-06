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

# add stangri repo source from github
sed -i '/stangri_repo/d' feeds.conf.default
! grep -q 'stangri_repo' feeds.conf.default && sed -i '5 i\src-git stangri_repo https://github.com/stangri/source.openwrt.melmac.net' feeds.conf.default

./scripts/feeds update -a
./scripts/feeds install -a -p packages
./scripts/feeds install -a -p luci
./scripts/feeds install -a -p routing
./scripts/feeds install -a -p telephony

# replace vpn routing packages
./scripts/feeds uninstall vpn-policy-routing
./scripts/feeds install -p stangri_repo vpn-policy-routing

# this does not work
#./scripts/feeds uninstall luci-app-vpn-policy-routing
#./scripts/feeds install -p stangri_repo luci-app-vpn-policy-routing

# Time stamp with $Build_Date=$(date +%Y.%m.%d)
echo -e '\nAO Build@'$(date "+%Y.%m.%d")'\n'  >> package/base-files/files/etc/banner
sed -i '/DISTRIB_REVISION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_REVISION='$(date "+%Y.%m.%d")'" >> package/base-files/files/etc/openwrt_release
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='AO Build@$(date "+%Y.%m.%d")'" >> package/base-files/files/etc/openwrt_release
sed -i '/luciversion/d' feeds/luci/modules/luci-base/luasrc/version.lua

rm -rf .config
