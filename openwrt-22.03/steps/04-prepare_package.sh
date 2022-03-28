#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

# clone stangri repo
rm -rf stangri_repo
git clone https://github.com/stangri/source.openwrt.melmac.net stangri_repo

# install feeds
cd openwrt

./scripts/feeds update -a
./scripts/feeds install -a -p packages
./scripts/feeds install -a -p luci
./scripts/feeds install -a -p routing
./scripts/feeds install -a -p telephony


# add pbr package
cp -R ../stangri_repo/pbr feeds/packages/net/
cp -R ../stangri_repo/luci-app-pbr feeds/luci/applications/

# this does not work
#./scripts/feeds uninstall luci-app-vpn-policy-routing
#./scripts/feeds install -p stangri_repo luci-app-vpn-policy-routing

# Time stamp with $Build_Date=$(date +%Y.%m.%d)
MANUAL_DATE="$(date +%Y.%m.%d) (manual build)"
BUILD_STRING=${BUILD_STRING:-$MANUAL_DATE}
echo "Write build date in openwrt : $BUILD_DATE"
echo -e '\nAO Build@'${BUILD_STRING}'\n'  >> package/base-files/files/etc/banner
#sed -i '/DISTRIB_REVISION/d' package/base-files/files/etc/openwrt_release
#echo "DISTRIB_REVISION='${BUILD_STRING}'" >> package/base-files/files/etc/openwrt_release
sed -i '/DISTRIB_DESCRIPTION/d' package/base-files/files/etc/openwrt_release
echo "DISTRIB_DESCRIPTION='AO Build@${BUILD_STRING}'" >> package/base-files/files/etc/openwrt_release
sed -i '/luciversion/d' feeds/luci/modules/luci-base/luasrc/version.lua

rm -rf .config
