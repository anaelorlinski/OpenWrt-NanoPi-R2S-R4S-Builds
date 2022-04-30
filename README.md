## OpenWrt Builds for NanoPi R2S & NanoPi R4S
Automated builds of OpenWrt for FriendlyARM NanoPi R2S & R4S boards

⚠ Warning: No support / Use at your own risk  ⚠ 

[![NanoPi Build](https://github.com/anaelorlinski/OpenWrt-NanoPi-R2S-R4S-Builds/actions/workflows/NanoPi-Build.yml/badge.svg)](https://github.com/anaelorlinski/OpenWrt-NanoPi-R2S-R4S-Builds/actions/workflows/NanoPi-Build.yml)


## OpenWrt branch 21.02 (stable)

### Downloads [Releases 21.02](https://github.com/anaelorlinski/OpenWrt-NanoPi-R2S-R4S-Builds/releases?q=21.02&expanded=true)

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

## OpenWrt branch 22.03 (WIP experimental)

### Downloads [Releases 22.03](https://github.com/anaelorlinski/OpenWrt-NanoPi-R2S-R4S-Builds/releases?q=m22.03&expanded=true)

### Configuration
- OpenWRT master Vanilla / Kernel 5.10
- ImmortalWRT patches for Rockchip target NanoPi R2S (rk3328) / NanoPi R4S support (rk3399)

### Applications
- A useful set of applications from official OpenWrt package feed
- Mini build without UI
- Full build with LuCI, docker and extra packages
- pbr latest version from https://github.com/stangri/source.openwrt.melmac.net


## Changelog
#### 2022-04-30
- (21.02) Remove acme/adblock in favor of uacme/adguardhome (mini)
- (21.02) Add uacme/adguardhome (full)
#### 2022-04-28
- (22.03) Add NanoPi R2C support
#### 2022-04-12
- (21.02) Add NanoPi R2C support
#### 2022-03-28
- Add branch 22.03
#### 2022-02-12
- Add losetup, cfdisk in builds. Fix issue #11 : Check docs/resize-f2fs.md how to resize.
- Branch 21.02 : use gcc 10.2
- Optimized builds for devices R4S:-mcpu=cortex-a72.cortex-a53+crypto+crc R2S:-mcpu=cortex-a53+crypto+crc
#### 2021-12-23
- Add libreswan package and deps in full build
#### 2021-12-23
- Fix issue #11 so r4s 1Gb boots
#### 2021-10-11
- Refresh uboot
#### 2021-07-07
- Fix issue #3 with strangri_repo : thanks TheLinuxGuy for reporting
- Fix issue #4 with dnsmasq misconfigured : thanks semicuda for reporting
#### 2021-05-27
- Add ddns-scripts and bind-tools
#### 2021-05-25
- Increase kernel partition size on full build
#### 2021-05-21
- Add kernel options related to Docker (full build)
- There are now 2 builds (mini/full) with different packages and kernel settings
#### 2021-05-14
- Add Docker
#### 2021-05-07
- Always get latest version of vpn-policy-routing package
- Remove watchdog (does not work) 
#### 2021-04-29
- Add more packages, add snd-usb-caiaq module

## Thanks to Original Project:
- [quintus-lab](https://github.com/quintus-lab/OpenWRT-Rockchip)

## License
[MIT](https://github.com/anaelorlinski/OpenWRT-Rockchip/blob/master/LICENSE)
