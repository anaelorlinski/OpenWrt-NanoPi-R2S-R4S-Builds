#!/bin/bash

#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

BUILDDIR="$ROOTDIR/build"
cd $BUILDDIR

# update instead of cloning
cd $BUILDDIR/openwrt-fresh-2102
git pull

cd $ROOTDIR
echo -n "Step 02...\n------------------------------"
./steps/21.02/02_prepare_openwrt_folder.sh
echo -n "Step 03...\n------------------------------"
./steps/21.02/R2S/03_patch_openwrt.sh
echo -n "Step 04...\n------------------------------"
./steps/04-prepare_package.sh
echo -n "Step 05...\n------------------------------"
./steps/05-create_luci_acl.sh
echo -n "Step 06...\n------------------------------"
./steps/06-create_config_from_toolchain_seed.sh

cd $BUILDDIR/openwrt
make download -j 12
make toolchain/install -j 12
make -j 12


