#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# 预置openclash内核
mkdir -p files/etc/openclash/core
OPENCLASH_MAIN_URL=$( curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-amd64 | awk -F '"' '{print $4}')
CLASH_TUN_URL=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-amd64 | awk -F '"' '{print $4}')
wget -qO- $OPENCLASH_MAIN_URL | tar xOvz > files/etc/openclash/core/clash
wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
chmod +x files/etc/openclash/core/clash*
# openclash


# 使用配置的system
# wget -qO URL > files/etc/config/system

# 内置smartdns
# mkdir -p files/etc/smartdns
# wget -qO URL > files/etc/smartdns/custom.conf
# wget -qO URL > files/etc/config/smartdns
