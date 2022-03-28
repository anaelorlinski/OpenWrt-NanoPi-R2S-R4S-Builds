#!/bin/bash
ROOTDIR=$(pwd)
echo $ROOTDIR
if [ ! -e "$ROOTDIR/build" ]; then
    echo "Please run from root / no build dir"
    exit 1
fi

BUILDDIR="$ROOTDIR/build"

cd "$BUILDDIR/openwrt"
OPENWRT_SUFFIX=2203
OPENWRT_BRANCH=22.03

# -------------- UBOOT -----------------------------------
# replace uboot with local uboot package
# this version does not need arm-trusted-firmware-rk3328
rm -rf package/boot/uboot-rockchip
cp -R $ROOTDIR/package/uboot-rockchip package/boot/

# -------------- target rockchip / linux ----------------
# replace target rockchip with immortalwrt one
rm -rf target/linux/rockchip
cp -R $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/immortalwrt/target/linux/rockchip target/linux/

# remove patches that make kernel panic
#  do not forget to run 03.sh !!!!!!! then make target/linux/clean   
rm target/linux/rockchip/patches-5.10/805*       # kernel oops, remove !!!
rm target/linux/rockchip/patches-5.10/9*

#copy crafted patch
#cp $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/kernel-5.4/add-rk3328-usb3-phy-driver.patch target/linux/rockchip/patches-5.4/808-add-rk3328-usb3-phy-driver.patch
# enable PHY usb3 for r2s
#sed -i 's/# CONFIG_PHY_ROCKCHIP_INNO_USB3 is not set/CONFIG_PHY_ROCKCHIP_INNO_USB3=y/' target/linux/rockchip/armv8/config-5.4



# ------------------ packages ------------------------------------

# arm trusted firmware
#rm -rf package/boot/arm-trusted-firmware-rockchip
#cp -R $BUILDDIR/immortal-fresh/package/boot/arm-trusted-firmware-rockchip package/boot/

# new video module dependancy for rockchip drm
rm -f package/kernel/linux/modules/video.mk
cp -R $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/immortalwrt/package/kernel/linux/modules/video.mk package/kernel/linux/modules/

# r8168 driver for r4s
cp -R $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/immortalwrt/package/kernel/r8168 package/kernel/

# copy extra patch from immortalwrt
cp $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/immortalwrt/package/libs/mbedtls/patches/100-Implements-AES-and-GCM-with-ARMv8-Crypto-Extensions.patch \
   package/libs/mbedtls/patches/

# enable watchdog
#sed -i 's/# CONFIG_WATCHDOG is not set/CONFIG_WATCHDOG=y/' target/linux/rockchip/armv8/config-5.4
#sed -i '/CONFIG_WATCHDOG=y/a CONFIG_DW_WATCHDOG=y' target/linux/rockchip/armv8/config-5.4
#cp $ROOTDIR/patches/kernel-5.4/995-watchdog-rk3328.patch target/linux/rockchip/patches-5.4/
#cp $ROOTDIR/patches/kernel-5.4/996-watchdog-rk3399.patch target/linux/rockchip/patches-5.4/
#cp $ROOTDIR/patches/kernel-5.4/997-clk-rk3328.patch target/linux/rockchip/patches-5.4/

# enable crypto
if ! grep -q "0002-kernel-crypto.addon" target/linux/rockchip/armv8/config-5.10; then
   echo "Adding 0002-kernel-crypto.addon to target/linux/rockchip/armv8/config-5.10"
   echo "# --- 0002-kernel-crypto.addon " >> target/linux/rockchip/armv8/config-5.10
   cat $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/0002-kernel-crypto.addon >> target/linux/rockchip/armv8/config-5.10
else
   echo "Already added 0002-kernel-crypto.addon to target/linux/rockchip/armv8/config-5.10"
fi

# add caiaq usb sound module for shairport with old soundcard
ADDON_PATH='snd-usb-caiaq.makefileaddon'
ADDON_DEST='package/kernel/linux/modules/usb.mk'
if ! grep -q " --- $ADDON_PATH" $ADDON_DEST; then
   echo "Adding $ADDON_PATH to $ADDON_DEST"
   echo "# --- $ADDON_PATH" >> $ADDON_DEST
   cat $ROOTDIR/openwrt-$OPENWRT_BRANCH/patches/$ADDON_PATH >> $ADDON_DEST
else
   echo "Already added $ADDON_PATH to $ADDON_DEST"
fi

#cleanup
if [ -e .config ]; then
   echo "Cleaning up ..."
   make target/linux/clean
   make package/boot/uboot-rockchip/clean
fi