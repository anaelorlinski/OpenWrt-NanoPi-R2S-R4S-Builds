## OpenWrt 25.12

### General Info
- Based on openwrt 25.12.5

### Notes
- For R2S, theres almost no difference with official builds, except the preinstalled package set
- Upgrade path is untested and not planned to be supported.
- Warning: network config now uses `list ipaddr '192.168.1.1/24'` (CIDR, no `netmask` option); scripts doing `uci set network.lan.ipaddr=<ip>` end up with a /32 address and lose LAN access.

### Configuration
- OpenWRT 25.12 Vanilla / Kernel 6.12
- NanoPi R4S : r8168 driver for R4S (realtek) instead of kernel r8169 + r8169 firmwares package
- uBoot patches to boot on R4S 1Gb

### Applications
- A useful set of applications from official OpenWrt package feed
- Mini build without UI
- Full build with LuCI, docker and extra packages
- firewall4 based (nftables) + iptables compatibility packages for now, might change later.
- pbr branch 1.2.2 from https://github.com/mossdef-org/pbr/

### Kernel Modules
- Some kernel modules are built and bundled in the images in /apks/ so they can be installed without package mismatch error
- Package manager has changed from opkg to apk
- run apk update before installing new packages to pickup local packages

### Changelog
- [2026-06-22] Initial OpenWrt 25.12.4
- [2026-10-11] Initial OpenWrt 25.12.5
