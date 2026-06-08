include $(TOPDIR)/rules.mk

PKG_NAME:=hermes-vendor
PKG_VERSION:=0.16.0
PKG_RELEASE:=1

PKG_MAINTAINER:=BiaBuzz <noreply@github.com>
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

define Package/hermes-vendor
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=Pre-compiled Python packages for Hermes Agent
  URL:=https://hermes-agent.nousresearch.com
  DEPENDS:=+hermes-agent
endef

define Package/hermes-vendor/description
  Pre-compiled Python C extensions and vendor packages for Hermes Agent.
  Includes cryptography, psutil, markupsafe, and other packages that
  require native compilation.
endef

define Build/Compile
	@echo "hermes-vendor: pre-compiled, no build needed"
endef

define Package/hermes-vendor/install
	$(INSTALL_DIR) $(1)/usr/lib/hermes-agent/vendor
ifeq ($(ARCH),x86_64)
	$(CP) ./files/x86_64/* $(1)/usr/lib/hermes-agent/vendor/
else ifeq ($(ARCH),aarch64)
	$(CP) ./files/aarch64/* $(1)/usr/lib/hermes-agent/vendor/
else ifeq ($(ARCH),arm)
	$(CP) ./files/arm/* $(1)/usr/lib/hermes-agent/vendor/
endif
endef

$(eval $(call BuildPackage,hermes-vendor))
