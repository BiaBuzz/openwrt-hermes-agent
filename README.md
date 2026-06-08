# OpenWrt Hermes Agent

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![OpenWrt](https://img.shields.io/badge/OpenWrt-25.x-blue.svg)](https://openwrt.org)
[![GitHub Release](https://img.shields.io/github/v/release/BiaBuzz/openwrt-hermes-agent)](https://github.com/BiaBuzz/openwrt-hermes-agent/releases)

**Hermes Agent for OpenWrt** — AI-powered assistant adapted for routers and embedded devices.

Based on [Hermes Agent](https://github.com/NousResearch/hermes-agent) by [Nous Research](https://nousresearch.com) (MIT License).

## Features

- 🤖 Full Hermes Agent on OpenWrt — tool calling, web search, code execution
- 🌐 LuCI web management interface (Services → HermesWRT)
- 📦 Pre-built APK packages for x86_64 and aarch64
- 🔧 UCI configuration integration (`/etc/config/hermes`)
- 🚀 procd service management with auto-restart
- 💾 Optimized for router storage and memory constraints

## Supported Devices

| Architecture | Device | Status |
|-------------|--------|--------|
| x86_64 | Generic PC, virtual machines | ✅ Supported |
| aarch64 | Globitel BT-R320 (MT7981) | ✅ Supported |
| aarch64 | Other ARM64 routers | 🔜 Community contributions welcome |

> **Storage requirement:** ~200MB free space (hermes-agent + node.js + vendor packages)

## Installation

### Method 1: Pre-built APK (Recommended)

Download the latest `.apk` for your architecture from [Releases](https://github.com/BiaBuzz/openwrt-hermes-agent/releases), then:

```bash
# Upload to router
scp hermes-agent_*.apk hermes-vendor_*.apk luci-app-hermeswrt_*.apk root@your-router:/tmp/

# Install
ssh root@your-router
apk add --allow-untrusted /tmp/hermes-agent_*.apk /tmp/hermes-vendor_*.apk /tmp/luci-app-hermeswrt_*.apk
```

### Method 2: Add as SDK Feed

```bash
# In your OpenWrt SDK directory
echo "src-git hermeswrt https://github.com/BiaBuzz/openwrt-hermes-agent.git" >> feeds.conf.default
./scripts/feeds update hermeswrt
./scripts/feeds install hermes-agent hermes-vendor luci-app-hermeswrt
make package/hermes-agent/compile V=s
make package/hermes-vendor/compile V=s
make package/luci-app-hermeswrt/compile V=s
```

### Method 3: Build from Source

See [docs/BUILD.md](docs/BUILD.md) for detailed build instructions.

## Configuration

After installation, configure via:

**LuCI (Web UI):**
Navigate to Services → HermesWRT and fill in your LLM provider details.

**CLI:**
```bash
uci set hermes.main.enabled=1
uci set hermes.main.provider=custom
uci set hermes.main.model=mimo-v2.5-pro
uci set hermes.main.base_url=https://api.openai.com/v1
uci set hermes.main.api_key=your-api-key
uci commit hermes
/etc/init.d/hermes-agent start
```

## Architecture

This repository is an **OpenWrt package feed** containing three packages:

| Package | Description |
|---------|-------------|
| `hermes-agent` | Core agent with node.js runtime, procd integration |
| `hermes-vendor` | Pre-compiled Python C extensions (per-architecture) |
| `luci-app-hermeswrt` | LuCI web management interface |

### Design Decisions

- **No browser engine:** Browser tools are disabled on routers (`browser.engine=none`). Web content is fetched via `curl`/`web_extract`. Interactive browsing is handled by remote CDP connections.
- **Pre-compiled vendor:** Python packages with C extensions (cryptography, psutil, etc.) are pre-compiled per-architecture to avoid build dependencies on the router.
- **Bundled node.js:** The node.js runtime is included in the package to avoid dependency on system node.

## Upstream

This project packages [Hermes Agent](https://github.com/NousResearch/hermes-agent) for OpenWrt. Core agent development is by [Nous Research](https://nousresearch.com).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

- **This packaging:** [MIT](LICENSE)
- **Hermes Agent (upstream):** [MIT](https://github.com/NousResearch/hermes-agent/blob/main/LICENSE)

## 中文说明

本项目是 [Hermes Agent](https://github.com/NousResearch/hermes-agent) 的 OpenWrt 移植版，提供预编译的 APK 安装包和 LuCI 管理界面。

**支持设备：** x86_64 通用路由器、Globitel BT-R320 (aarch64)

**安装方法：** 从 [Releases](https://github.com/BiaBuzz/openwrt-hermes-agent/releases) 下载对应架构的 APK 文件，上传到路由器后 `apk add` 安装。

**配置方式：** 安装后通过 LuCI（服务 → HermesWRT）或 UCI 命令行配置 LLM 提供商和模型。
