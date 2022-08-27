#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

OPENWRT_BRANCH=22.03

cd "$ROOTDIR/build"

# clone stangri repo
rm -rf stangri_repo
git clone https://github.com/stangri/source.openwrt.melmac.net stangri_repo

# install feeds
cd openwrt
./scripts/feeds update -a

# replace vpn routing packages
rm -rf feeds/packages/net/vpn-policy-routing/
cp -R ../stangri_repo/vpn-policy-routing feeds/packages/net/
rm -rf feeds/luci/applications/luci-app-vpn-policy-routing
cp -R ../stangri_repo/luci-app-vpn-policy-routing feeds/luci/applications/

# add pbr
cp -R ../stangri_repo/pbr feeds/packages/net/
cp -R ../stangri_repo/luci-app-pbr feeds/luci/applications/

# replace acme & haproxy with newer versions taken from master
rm -rf feeds/packages/net/acme*
cp -R $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/package/acme* feeds/packages/net/
rm -rf feeds/packages/net/haproxy
cp -R $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/package/haproxy* feeds/packages/net/

# replace adguardhome with prebuilt latest version
rm -rf feeds/packages/net/adguardhome
cp -R $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/package/adguardhome feeds/packages/net/

./scripts/feeds update -i && ./scripts/feeds install -a

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
