# Build Guide

## Prerequisites

- Linux host (Ubuntu/Debian recommended)
- OpenWrt SDK 25.12.4 or later
- GCC 14.3.0 (included in SDK)

## Known Issues

### Perl GCC14 Compatibility

When building with GCC 14.x, perl may fail with errors like:
```
doio.c:218:9: error: implicit declaration of function 'dup3'
```

**Fix:** Add `-D_GNU_SOURCE` to perl's CFLAGS in `feeds/packages/lang/perl/Makefile`:
```makefile
ifneq ($(CONFIG_USE_MUSL),)
  TARGET_CFLAGS += -D_LARGEFILE64_SOURCE -D_GNU_SOURCE
endif
```

This is a known upstream issue: https://github.com/openwrt/packages/issues/25166

### libc Dependency

The hermes-agent package uses `@LIBC_DEPENDS` instead of `+libc` for proper dependency resolution with musl libc.

## Building

### Using HermesWRT Build System

```bash
cd HermesWRT
bash build.sh 25_12_4_x86_64_FULL  # For x86_64
bash build.sh 25_12_4_BT_R320      # For BT-R320 (aarch64)
```

### Manual SDK Build

```bash
cd openwrt-sdk-*
make package/hermes-agent/compile V=s -j$(nproc)
```

## Output

APK packages are generated in:
- `bin/packages/x86_64/base/hermes-*.apk` (x86_64)
- `bin/packages/aarch64_cortex-a53/base/hermes-*.apk` (aarch64)
