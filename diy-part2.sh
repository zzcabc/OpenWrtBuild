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
sed -i 's/192.168.1.1/10.10.10.10/g' package/base-files/files/bin/config_generate

# 预置openclash内核
mkdir -p files/etc/openclash/core
# dev内核
CLASH_DEV_URL=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-amd64.tar.gz | awk -F '"' '{print $4}')
# tun内核
CLASH_TUN_URL=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-amd64 | awk -F '"' '{print $4}' | head -n 1)
# d大的普核
# CLASH_DEV_URL=$(curl -sL https://api.github.com/repos/Dreamacro/clash/releases/latest | grep /clash-linux-amd64-v1 | awk -F '"' '{print $4}')
# d大的premium核
# CLASH_TUN_URL=$(curl -sL https://api.github.com/repos/Dreamacro/clash/releases/tags/premium | grep /clash-linux-amd64 | awk -F '"' '{print $4}' | head -n 1)
# meta核
CLASH_META_URL=$(curl -sL https://api.github.com/repos/MetaCubeX/Clash.Meta/releases/tags/alpha | grep /Clash.Meta-linux-amd64v1 | awk -F '"' '{print $4}' | head -n 1)
wget -qO- $CLASH_DEV_URL | tar xOvz > files/etc/openclash/core/clash
wget -qO- $CLASH_TUN_URL | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $CLASH_META_URL | gunzip -c > files/etc/openclash/core/clash_meta
chmod +x files/etc/openclash/core/clash*

# Country.mmdb
# COUNTRY_LITE_URL=https://raw.githubusercontent.com/alecthw/mmdb_china_ip_list/release/lite/Country.mmdb
# COUNTRY_FULL_URL=https://raw.githubusercontent.com/alecthw/mmdb_china_ip_list/release/Country.mmdb
# wget $COUNTRY_LITE_URL > files/etc/openclash/Country.mmdb

# meta可能要GeoIP.dat 和 GeoSite.dat
# GEOIP_URL=https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat
# GEOSITE_URL=https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat
# wget $GEOIP_URL > files/etc/openclash/GeoIP.dat
# wget $GEOSITE_URL > files/etc/openclash/GeoSite.dat