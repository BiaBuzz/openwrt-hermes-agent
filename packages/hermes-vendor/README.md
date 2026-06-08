# Vendor Packages

Place pre-compiled Python packages for each architecture in the corresponding directory:

- `x86_64/` — Pre-compiled .so files for x86_64
- `aarch64/` — Pre-compiled .so files for aarch64 (ARM64)
- `arm/` — Pre-compiled .so files for ARM (32-bit)

## Required Packages

The following Python packages with C extensions must be pre-compiled:

- `cryptography` (+ `_cffi_backend.so`)
- `psutil` (`_psutil_linux.so`, `_psutil_posix.so`)
- `markupsafe` (`_speedups.so`)
- `ruamel.yaml` (`_ruamel_yaml.so`)

## How to Compile

On a device with the same architecture and musl libc:

```bash
pip3 install --target=./ cryptography psutil markupsafe ruamel.yaml
find . -name "*.so" -exec file {} \;  # Verify architecture
```

Pure Python packages (.py files) are included in the main hermes-agent package.
Only packages with native C extensions (.so files) need to be here.
