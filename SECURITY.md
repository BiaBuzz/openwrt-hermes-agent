# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| Latest release | ✅ |
| Older releases | ❌ |

## Reporting a Vulnerability

If you discover a security vulnerability, please report it responsibly:

1. **Do NOT** open a public GitHub issue for security vulnerabilities
2. Email security concerns or use GitHub's private vulnerability reporting
3. Include steps to reproduce and potential impact

We aim to respond within 48 hours and provide a fix within 7 days for critical issues.

## Security Considerations

- Hermes Agent runs with root privileges on OpenWrt routers
- API keys are stored in `/etc/config/hermes` (readable by root only)
- The agent has access to the router's network and system tools
- Browser tools are disabled by default on routers (no headless browser attack surface)
