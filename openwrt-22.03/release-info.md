## OpenWrt branch 22.03 (experimental WIP)

### Warning
- Fully experimental build, still WIP.
- R2S / R4S patches will be reviwed if still needed
- Goal is to get rid of iptables if possible.

### Configuration
- OpenWRT 22.03 Vanilla / Kernel 5.10
- ImmortalWRT patches for Rockchip target NanoPi R2S (rk3328) / NanoPi R4S support (rk3399)
- NanoPi R4S : r8168 driver for R4S (realtek) instead of kernel r8169 + r8169 firmwares package

### Applications
- A useful set of applications from official OpenWrt package feed
- Mini build without UI
- Full build with LuCI, docker and extra packages
- firewall4 based (nftables) + iptables compatibility packages for now, might change later.
- pbr latest version from https://github.com/stangri/source.openwrt.melmac.net

### Changelog
- [2022-09-17] Align patches / Haproxy 2.6.5
- [2022-08-30] Add qosify
- [2022-08-25] Update U-Boot to 2022.07 (only tested on R4S 4GB)
- [2022-08-25] Backport Packages from master
- [2022-08-25] Update r8168 driver
- [2022.08.19] Rework patches
- [2022.08.17] Update 22.03 seeds to match 21.02
- [2022.08.17] Add watchcat
