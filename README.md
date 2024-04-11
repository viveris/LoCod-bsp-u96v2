# LoCoD BSP
This repository allows to build the BSP of the AVNET Ultra96 v2 board.

Petalinux 2022.1 is nedded to build the BSP.

# Build petalinux project

To build the project :

    petalinux-build

When build is finished, create BOOT.BIN file :

    petalinux-package --boot --format BIN --fsbl --u-boot --pmufw --fpga --force

The files needed for deploy the bsp are :

* images/linux/BOOT.BIN
* images/linux/Image
* images/linux/system.dtb
* images/linux/rootfs.tar.gz

# Deploy on the board
To deploy the BSP on the board, the files below shall be copied on the first partition of the SD card :
* BOOT.BIN
* Image
* system.dtb

The rootfs.tar.gz file shall be extracted into the second partition.
