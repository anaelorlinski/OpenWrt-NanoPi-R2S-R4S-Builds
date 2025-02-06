#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

cd openwrt

# patch config to build all kernel modules
sed -i -e '/^# CONFIG_PACKAGE_kmod-/d' .config
echo CONFIG_ALL_KMODS=y >> .config
make defconfig

rm -rf bin/
rm -rf files/ipks/
let make_process=$(nproc)+1

# compile toolchain if not built yet
make toolchain/install -j${make_process} || { make toolchain/install -j 1 V=s ; exit 1 ; }

# compile kernel kmods and build packages
make target/compile -j ${make_process} || { make target/compile -j 1 V=s ; exit 1 ; }
make package/linux/compile -j ${make_process} || { make package/linux/compile -j 1 V=s ; exit 1 ; }

# build signing tools and generate key
make package/usign/host/compile V=s || exit 1
make package/ucert/host/compile V=s || exit 1
make package/base-files/configure V=s || exit 1

# sign packages
make package/index V=s || exit 1
mkdir -p files/ipks
cd files/ipks
find ../../bin/targets/rockchip/armv8/packages/ -type f -exec ln {} . \;
cd ..
mkdir -p etc/uci-defaults
cat << "EOF" > etc/uci-defaults/99-local-ipks
echo "src/gz local file:///ipks/" >> /etc/opkg/distfeeds.conf
EOF

