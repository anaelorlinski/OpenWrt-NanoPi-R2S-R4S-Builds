## OpenWrt 21.02.4 (EOL)

### Configuration
- OpenWRT 21.02.4 Vanilla / Kernel 5.4
- ImmortalWRT patches for Rockchip target NanoPi R2S (rk3328) / NanoPi R4S support (rk3399)
- NanoPi R2S : r8152 driver v1.11.11 backport from kernel 5.10 + realtek r8169 firmwares package
- NanoPi R4S : r8168 driver for R4S (realtek) instead of kernel r8169 + r8169 firmwares package

### Applications
- A useful set of applications from official OpenWrt package feed
- Mini build without UI
- Full build with LuCI, docker and extra packages
- vpn-routing-policy more recent version

### Changelog
- Build from openwrt 21.02.4 tag instead of openwrt-21.02 branch
- Use default gcc version
- Freeze vpn-routing-policy