# Changelog

## [0.16.0-1] - 2026-06-08

### Added
- Initial release of Hermes Agent for OpenWrt
- x86_64 architecture support
- aarch64 architecture support (Globitel BT-R320)
- LuCI management interface (Services → HermesWRT)
- Pre-compiled Python vendor packages
- Bundled node.js v26.3.0 runtime
- procd service integration with auto-restart
- UCI configuration support (`/etc/config/hermes`)
- GitHub Actions automated APK builds

### Notes
- Based on Hermes Agent v0.16.0 by Nous Research
- Browser tools disabled by default (router-optimized)
- Requires ~200MB free storage

## [0.15.1-r3] - 2026-06-08

### Fixed
- Fixed libc dependency using `@LIBC_DEPENDS` instead of `+libc` for proper OpenWrt dependency resolution
- Added `-D_GNU_SOURCE` to perl compilation flags for GCC14 compatibility

### Added
- Pre-built APK packages for x86_64 and aarch64 (BT-R320)
- Build documentation with GCC14 compatibility notes
