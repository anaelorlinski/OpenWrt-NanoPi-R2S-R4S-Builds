#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=adguardhome
PKG_VERSION:=0.107.52
PKG_RELEASE:=1

# WARNING : need rework for other arch
PKG_SOURCE:=AdGuardHome_linux_arm64.tar.gz
PKG_SOURCE_URL:=https://github.com/AdguardTeam/AdGuardHome/releases/download/v$(PKG_VERSION)/
PKG_HASH:=86ae7a7c2db9c158b9db9f350568485e3ccc43e7039624d1a5bc50bb1dee1048

PKG_LICENSE:=GPL-3.0-only
PKG_LICENSE_FILES:=LICENSE.txt
PKG_MAINTAINER:=Dobroslaw Kijowski <dobo90@gmail.com>

include $(INCLUDE_DIR)/package.mk

define Package/adguardhome
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Network-wide ads and trackers blocking DNS server
	URL:=https://github.com/AdguardTeam/AdGuardHome
	DEPENDS:=+ca-bundle
endef

define Package/adguardhome/conffiles
/etc/adguardhome.yaml
/etc/config/adguardhome
endef

define Package/adguardhome/description
Free and open source, powerful network-wide ads and trackers blocking DNS server.
endef

define Build/Prepare
	$(TAR) -C $(PKG_BUILD_DIR) -xf $(DL_DIR)/$(PKG_SOURCE)
endef

define Build/Compile
endef

define Package/adguardhome/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/AdGuardHome/AdGuardHome $(1)/usr/bin/AdGuardHome
	
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/adguardhome.init $(1)/etc/init.d/adguardhome

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./files/adguardhome.config $(1)/etc/config/adguardhome
endef

$(eval $(call BuildPackage,adguardhome))
