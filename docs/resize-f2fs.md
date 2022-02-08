# How to expand filesystem to fill SD card

## Squashfs
Note : cfdisk, losetup and f2fs-tools are needed, included in latest images

1. first use cfdisk to expand partition
```
cfdisk /dev/mmcblk0
```
Select the second partition and resize it, write and quit.

2. grow f2fs filesystem
```
LOOP="$(losetup -n -O NAME | sort | sed -n -e "1p")"
ROOT="$(losetup -n -O BACK-FILE ${LOOP} | sed -e "s|^|/dev|")"
OFFS="$(losetup -n -O OFFSET ${LOOP})"
LOOP="$(losetup -f)"
losetup -o ${OFFS} ${LOOP} ${ROOT}
fsck.f2fs -f ${LOOP}
mount ${LOOP} /mnt
umount ${LOOP}
resize.f2fs ${LOOP}
reboot
```

## Notes

Original info from here : https://openwrt.org/docs/guide-user/installation/openwrt_x86#resizing_filesystem

