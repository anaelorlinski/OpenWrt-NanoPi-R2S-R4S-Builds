## OpenWrt 24.10

### General Info
- Based of openwrt 24.10.0

### Notes
- R4S is over-clocked to 2.0GHz on a72 cores and 1.6GHz on a53 cores.
- CycloneDX SBOM and full manifest is included in each release
- All kmods included in each release

### Configuration
- OpenWRT 24.10 Vanilla / Kernel 6.6
- ImmortalWRT patches for Rockchip target NanoPi R4S support (rk3399)
- Some network optimizations for reduced CPU usage
- Load balancing: eth0 and eth1 interrupts on a72 cores; RX queues spread across all four a53 cores
- 1024MB rootfs partition size

### Applications
- A useful set of applications from official OpenWrt package feed
- Full build with LuCI, docker, LXC and extra packages
- Firewall4 based (nftables) + iptables compatibility packages for now, might change later.
- Latest version pbr from https://github.com/stangri/source.openwrt.melmac.net

### Changelog
- [2025-02-06] Initial OpenWrt 24.10.0
