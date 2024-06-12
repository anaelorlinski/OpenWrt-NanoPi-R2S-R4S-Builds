## OpenWrt 23.05

### General Info
- Based of openwrt 23.05.3

### Notes
- R4S is over-clocked to 2.0GHz on a72 cores and 1.6GHz on a53 cores.
- CycloneDX SBOM is included in each release

### Configuration
- OpenWRT 23.05 Vanilla / Kernel 5.15
- ImmortalWRT patches for Rockchip target NanoPi R4S support (rk3399)
- NanoPi R4S : r8168 driver for R4S (realtek) instead of kernel r8169 + r8169 firmwares package
- 1024MB rootfs partition size

### Applications
- A useful set of applications from official OpenWrt package feed
- Full build with LuCI, docker, LXC and extra packages
- firewall4 based (nftables) + iptables compatibility packages for now, might change later.
- pbr latest version from https://github.com/stangri/source.openwrt.melmac.net

### Changelog
- [2024-03-27] OpenWrt 23.05.3
- [2023-11-15] OpenWrt 23.05.2
- [2023-10-13] OpenWrt 23.05.0
- [2023-08-22] OpenWrt 23.05.0-rc3
- [2023-06-28] Initial OpenWrt 23.05.0-rc2
