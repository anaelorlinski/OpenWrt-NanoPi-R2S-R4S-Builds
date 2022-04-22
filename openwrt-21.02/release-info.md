## OpenWrt branch 21.02 (stable)

### Configuration
- OpenWRT 21.02 Vanilla / Kernel 5.4
- ImmortalWRT patches for Rockchip target NanoPi R2S (rk3328) / NanoPi R4S support (rk3399)
- NanoPi R2S : r8152 driver v1.11.11 backport from kernel 5.10 + realtek r8169 firmwares package
- NanoPi R4S : r8168 driver for R4S (realtek) instead of kernel r8169 + r8169 firmwares package

### Applications
- A useful set of applications from official OpenWrt package feed
- Mini build without UI
- Full build with LuCI, docker and extra packages
- vpn-routing-policy latest version from https://github.com/stangri/source.openwrt.melmac.net

### Changelog
- Add losetup, cfdisk in builds. Fix issue #11 : Check docs/resize-f2fs.md how to resize.
- Branch 21.02 : use gcc 10.2
- Optimized builds for devices R4S:-mcpu=cortex-a72.cortex-a53+crypto+crc R2S:-mcpu=cortex-a53+crypto+crc