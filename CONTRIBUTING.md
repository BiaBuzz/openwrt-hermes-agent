# Contributing to OpenWrt Hermes Agent

Thank you for your interest in contributing!

## How to Contribute

### Reporting Issues
- Use GitHub Issues for bug reports and feature requests
- Include your OpenWrt version, device architecture, and steps to reproduce

### Submitting Changes
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/my-feature`)
3. Make your changes
4. Test on target architecture if possible
5. Commit with clear messages
6. Push and create a Pull Request

### Adding Device Support
To add support for a new device/architecture:
1. Add pre-compiled vendor packages to `packages/hermes-vendor/files/<arch>/`
2. Update `packages/hermes-vendor/Makefile` with the new architecture
3. Test on actual hardware
4. Submit a PR with test results

### Code Style
- OpenWrt Makefiles: follow [OpenWrt conventions](https://openwrt.org/docs/guide-developer/packages)
- Lua: follow existing LuCI coding style
- Shell scripts: POSIX sh compatible, `shellcheck` clean

## License
By contributing, you agree that your contributions will be licensed under the MIT License.
