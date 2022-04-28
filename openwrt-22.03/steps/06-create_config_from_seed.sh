#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

cd "$ROOTDIR/build"

cd openwrt
# copy R4S in any case, and then patch if R2S
cp $ROOTDIR/openwrt-22.03/seed/ao-R4S-$2.seed .config

# $1 is model
# if model == R2S, then patch .config
if [[ "$1" == "R2S" ]]; then
    echo "NanoPi R2S model, post patching .config"
    sed -i 's/nanopi-r4s/nanopi-r2s/' .config
    sed -i 's/cortex-a72.cortex-a53/cortex-a53/' .config
fi

if [[ "$1" == "R2C" ]]; then
    echo "NanoPi R2C model, post patching .config"
    sed -i 's/nanopi-r4s/nanopi-r2c/' .config
    sed -i 's/cortex-a72.cortex-a53/cortex-a53/' .config
fi

make defconfig
