#MMC Boot
setenv kernel_addr "0x11000000"
setenv fdt_addr "0x1000000"
setenv initrd_loadaddr "0x13000000"
setenv bootfile Image
setenv fdtfile meson64_odroidc2.dtb
setenv initrdfile uInitrd
setenv fsargs "setenv bootargs root=/dev/mmcblk1p2 rootfstype=ext4 rootwait rw no_console_suspend fsck.fix=yes"
setenv bootcmd 'fatload mmc 0:1 ${initrd_loadaddr} ${initrdfile} ;fatload mmc 0:1 ${kernel_addr} ${bootfile};fatload mmc 0:1 ${fdt_addr} ${fdtfile};run fsargs ;booti ${kernel_addr} ${initrd_loadaddr} ${fdt_addr}'
boot
