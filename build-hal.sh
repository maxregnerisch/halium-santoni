#!/bin/bash
source halium.env
cd $ANDROID_ROOT

# replace something
sed -i 's/external\/selinux/external\/selinux external\/libcurl/g' build/core/main.mk

source build/envsetup.sh
export USE_CCACHE=1
breakfast $DEVICE
make -j$(nproc) hybris-boot
make -j$(nproc) systemimage 
