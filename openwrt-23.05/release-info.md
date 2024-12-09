## OpenWrt 23.05

### General Info
- Based of openwrt 23.05.5

### Notes
- R4S is over-clocked to 2.0GHz on a72 cores and 1.6GHz on a53 cores.
- CycloneDX SBOM and full manifest is included in each release
- All kmods included in each release

### Configuration
- OpenWRT 23.05 Vanilla / Kernel 5.15
- ImmortalWRT patches for Rockchip target NanoPi R4S support (rk3399)
- Some network optimizations for reduced CPU usage
- Load balancing: eth0 and eth1 interrupts on a72 cores; RX queues spread across all four a53 cores
- 1024MB rootfs partition size

### Applications
- A useful set of applications from official OpenWrt package feed
- Full build with LuCI, docker, LXC and extra packages
- Firewall4 based (nftables) + iptables compatibility packages for now, might change later.
- Latest version pbr from https://github.com/stangri/source.openwrt.melmac.net
- Latest version luci-app-dockerman from https://github.com/lisaac/luci-app-dockerman

### Changelog
- [2024-09-25] OpenWrt 23.05.5
- [2024-09-07] Fix missing pbr
- [2024-09-06] Update adguardhome
- [2024-07-22] OpenWrt 23.05.4
- [2024-03-27] OpenWrt 23.05.3
- [2023-11-15] OpenWrt 23.05.2
- [2023-10-13] OpenWrt 23.05.0
- [2023-08-22] OpenWrt 23.05.0-rc3
- [2023-06-28] Initial OpenWrt 23.05.0-rc2
