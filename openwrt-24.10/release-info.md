## OpenWrt 24.10

### General Info
- Based of openwrt 24.10.2

### Notes
- For R2C/R2S, theres almost no difference with official builds, except the preinstalled package set

### Configuration
- OpenWRT 24.10 Vanilla / Kernel 6.6
- Cherry pick some ImmortalWRT patches for Rockchip target
- NanoPi R4S : r8168 driver for R4S (realtek) instead of kernel r8169 + r8169 firmwares package
- Older uBoot with patches to boot on R4S 1Gb

### Applications
- A useful set of applications from official OpenWrt package feed
- Mini build without UI
- Full build with LuCI, docker and extra packages
- firewall4 based (nftables) + iptables compatibility packages for now, might change later.
- pbr branch 1.1.8 from https://github.com/stangri/pbr

### Changelog
- [2025-03-21] Initial OpenWrt 24.10.0
- [2025-04-14] OpenWrt 24.10.1
- [2025-06-25] OpenWrt 24.10.2
