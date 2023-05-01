## OpenWrt 22.03.5 (stable)

### General Info
- Based of openwrt 22.03.5

### Configuration
- OpenWRT 22.03.5 Vanilla / Kernel 5.10
- ImmortalWRT patches for Rockchip target NanoPi R2S (rk3328) / NanoPi R4S support (rk3399)
- NanoPi R4S : r8168 driver for R4S (realtek) instead of kernel r8169 + r8169 firmwares package

### Applications
- A useful set of applications from official OpenWrt package feed
- Mini build without UI
- Full build with LuCI, docker and extra packages
- firewall4 based (nftables) + iptables compatibility packages for now, might change later.
- pbr latest version from https://github.com/stangri/source.openwrt.melmac.net

### Changelog
- [2023-05-01] OpenWrt 22.03.5
- [2023-04-16] Update haproxy / adguarhome
- [2023-04-10] OpenWrt 22.03.4
- [2023-01-07] Bundle kmods
- [2023-01-04] Freeze to OpenWrt 22.03.3 release instead of branch
- [2022-10-19] Re-Update U-Boot to 2022.07 and use FriendlyWrt patches
- [2022-09-28] Add kmod-sched
- [2022-09-27] Revert u-boot to 2021.07 to fix R4S 1Gb broken support
- [2022-09-17] Align patches / Haproxy 2.6.5
- [2022-08-30] Add qosify
- [2022-08-25] Update U-Boot to 2022.07 (only tested on R4S 4GB)
- [2022-08-25] Backport Packages from master
- [2022-08-25] Update r8168 driver
- [2022.08.19] Rework patches
- [2022.08.17] Update 22.03 seeds to match 21.02
- [2022.08.17] Add watchcat
