include $(TOPDIR)/rules.mk

PKG_NAME:=hermes-agent
PKG_VERSION:=0.16.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/NousResearch/hermes-agent.git
PKG_SOURCE_VERSION:=v$(PKG_VERSION)
PKG_MIRROR_HASH:=skip

PKG_MAINTAINER:=BiaBuzz <noreply@github.com>
PKG_LICENSE:=MIT

include $(INCLUDE_DIR)/package.mk

NODE_VERSION:=26.3.0

define Package/hermes-agent
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Hermes Agent — AI agent for OpenWrt
  URL:=https://hermes-agent.nousresearch.com
  DEPENDS:=+python3 +python3-cryptography +python3-requests +python3-yaml            +python3-jinja2 +python3-click +python3-dotenv +python3-psutil            +python3-certifi +python3-chardet +python3-idna +python3-urllib3            +libc +libpthread
endef

define Package/hermes-agent/description
  Hermes Agent is an AI-powered assistant by Nous Research, adapted for
  OpenWrt routers. Includes node.js runtime, pre-compiled Python packages,
  and a LuCI management interface.
endef

ifeq ($(ARCH),x86_64)
  NODE_URL:=https://unofficial-builds.nodejs.org/download/release/v$(NODE_VERSION)/node-v$(NODE_VERSION)-linux-x64-musl.tar.xz
  NODE_DIR:=node-v$(NODE_VERSION)-linux-x64-musl
else ifeq ($(ARCH),aarch64)
  NODE_URL:=https://unofficial-builds.nodejs.org/download/release/v$(NODE_VERSION)/node-v$(NODE_VERSION)-linux-arm64-musl.tar.xz
  NODE_DIR:=node-v$(NODE_VERSION)-linux-arm64-musl
endif

define Build/Compile
	@echo "Hermes Agent: no compilation needed (Python source)"
endef

define Package/hermes-agent/conffiles
/etc/config/hermes
/etc/hermes-agent/config.yaml
endef

define Package/hermes-agent/install
	$(INSTALL_DIR) $(1)/usr/lib/hermes-agent
	$(CP) $(PKG_BUILD_DIR)/*.py $(1)/usr/lib/hermes-agent/
	$(CP) $(PKG_BUILD_DIR)/agent $(1)/usr/lib/hermes-agent/
	$(CP) $(PKG_BUILD_DIR)/tools $(1)/usr/lib/hermes-agent/
	$(CP) $(PKG_BUILD_DIR)/gateway $(1)/usr/lib/hermes-agent/
	$(CP) $(PKG_BUILD_DIR)/plugins $(1)/usr/lib/hermes-agent/
	$(CP) $(PKG_BUILD_DIR)/skills $(1)/usr/lib/hermes-agent/
	$(CP) $(PKG_BUILD_DIR)/optional-skills $(1)/usr/lib/hermes-agent/

	$(INSTALL_DIR) $(1)/usr/lib/hermes-agent/node/bin
	$(INSTALL_DIR) $(1)/usr/lib/hermes-agent/vendor

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/agent-browser $(1)/usr/bin/agent-browser
	$(INSTALL_BIN) ./files/hermes-runner $(1)/usr/bin/hermes-runner

	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./files/hermes-agent.init $(1)/etc/init.d/hermes-agent

	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./files/hermes.config $(1)/etc/config/hermes

	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/90-hermes-defaults $(1)/etc/uci-defaults/90-hermes-defaults
endef

define Package/hermes-agent/postinst
#!/bin/sh
[ -n "$${IPKG_INSTROOT}" ] || {
	/etc/init.d/hermes-agent enable
	echo "Hermes Agent installed. Configure via LuCI (Services > HermesWRT) or /etc/config/hermes"
}
endef

$(eval $(call BuildPackage,hermes-agent))
