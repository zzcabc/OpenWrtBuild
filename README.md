# OpenWrtBuild 精简自用 x84_64

本项目Fork p3terx

## 使用的源码
|源码|版本|
|--|--|
|[immortalwrt](https://github.com/immortalwrt/immortalwrt/tree/openwrt-18.06-k5.4)|18.06-k5.4|
|[immortalwrt](https://github.com/immortalwrt/immortalwrt)|21.02|
|[immortalwrt](https://github.com/immortalwrt/immortalwrt/tree/master)|master|
|[lede](https://github.com/coolsnowwolf/lede)|master|


## 插件列表

|英文名称|中文名称|
|--|--|
|luci-app-argon-config|argon主题配置|
|luci-app-autoreboot|定时重启|
|luci-app-filetransfer|文件传输(默认)|
|luci-app-firewall|防火墙(默认)|
|luci-app-iptvhelper|iptv助手(lede无)|
|luci-app-mosdns|mosdns|
|luci-app-nft-qos|QoS Nftables 版|
|luci-app-iptvhelper|iptv助手(lede无)|
|luci-app-openclash|openclash|
|luci-app-passwall|passwall|
|luci-app-smartdns|smartdns|
|luci-app-ssr-plus|ssrplus|
|luci-app-ttyd|网页的ssh|
|luci-app-turboacc|turboacc|
|luci-app-unblockneteasemusic|网易云解锁|
|luci-app-upnp|端口转发|
|luci-app-vlmcsd|Windows系统激活|
|luci-app-webadmin|web管理|

## 改动
1. ip地址改为 `10.10.10.10`
2. 网卡驱动 `r8168`
3. 无线网卡驱动 `mt76x02`
4. 文本编辑 `vim和nano`
5. 默认 `启用NTP服务器`
6. dhcp配置启动 `顺序分配ip,不缓存dns`
7. turboacc只开启 `BBR拥塞控制算法`
8. 启动smartdns `6053端口为国内DNS,7053端口为国外DNS`
9. 关闭mosdns `使用自定义配置，端口为5335`
10. openclash `选择Redit-Host的TUN混合模式`
11. openclash `GEO数据库每周二0点更新`
12. openclash `集成dev内核、TUN内核、和Meta的alpha内核`
13. openclash `默认上游DNS为smartdns`
14. 默认 `关闭QoSNftables`
