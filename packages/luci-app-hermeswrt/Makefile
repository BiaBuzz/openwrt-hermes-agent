include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-hermeswrt
PKG_VERSION:=1.0.0
PKG_RELEASE:=1

PKG_MAINTAINER:=BiaBuzz <noreply@github.com>
PKG_LICENSE:=MIT

LUCI_TITLE:=HermesWRT — Hermes Agent management interface
LUCI_DEPENDS:=+luci-compat +hermes-agent
LUCI_DESCRIPTION:=LuCI interface for managing Hermes Agent on OpenWrt routers.

include $(TOPDIR)/feeds/luci/luci.mk

define Package/luci-app-hermeswrt/conffiles
/etc/config/hermes
endef

$(eval $(call BuildPackage,luci-app-hermeswrt))
