# Building from Source

## Prerequisites

- OpenWrt SDK 25.x (download from https://downloads.openwrt.org)
- Linux host (x86_64)
- ~10GB free disk space

## Steps

```bash
# 1. Download and extract SDK
wget https://downloads.openwrt.org/releases/25.12.4/targets/x86/64/openwrt-sdk-25.12.4-x86-64_gcc-14.3.0_musl.Linux-x86_64.tar.zst
tar --use-compress-program=unzstd -xf openwrt-sdk-*.tar.zst
cd openwrt-sdk-*

# 2. Add package feed
echo "src-git hermeswrt https://github.com/BiaBuzz/openwrt-hermes-agent.git" >> feeds.conf.default
./scripts/feeds update hermeswrt
./scripts/feeds install hermes-agent hermes-vendor luci-app-hermeswrt

# 3. Configure
make defconfig

# 4. Build
make package/hermes-agent/compile V=s
make package/hermes-vendor/compile V=s
make package/luci-app-hermeswrt/compile V=s

# 5. Find APKs
ls bin/packages/*/hermeswrt/
```

## Vendor Packages

The `hermes-vendor` package contains pre-compiled Python C extensions.
To rebuild vendor packages for a new architecture:

```bash
# On target device or cross-compilation environment
pip3 install --target=vendor/ cryptography psutil markupsafe ruamel.yaml
tar czf vendor-<arch>.tar.gz vendor/
# Upload to packages/hermes-vendor/files/<arch>/
```
