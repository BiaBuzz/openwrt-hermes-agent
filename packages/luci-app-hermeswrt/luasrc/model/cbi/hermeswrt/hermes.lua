m = Map("hermes", translate("HermesWRT"),
    translate("Configure Hermes Agent — AI assistant for your router."))

-- Status section
s = m:section(TypedSection, "hermes", translate("Service Status"))
s.anonymous = true
s.addremove = false

enabled = s:option(Flag, "enabled", translate("Enable Hermes Agent"),
    translate("Start Hermes Agent on boot and keep it running."))
enabled.default = "0"
enabled.rmempty = false

-- LLM Configuration
s2 = m:section(TypedSection, "hermes", translate("LLM Configuration"))
s2.anonymous = true
s2.addremove = false

provider = s2:option(ListValue, "provider", translate("Provider"))
provider:value("custom", translate("Custom OpenAI-compatible"))
provider:value("openrouter", translate("OpenRouter"))
provider.default = "custom"

model = s2:option(Value, "model", translate("Model"))
model.default = "mimo-v2.5-pro"
model.rmempty = false

base_url = s2:option(Value, "base_url", translate("API Base URL"),
    translate("e.g. https://api.openai.com/v1"))
base_url.placeholder = "https://api.openai.com/v1"

api_key = s2:option(Value, "api_key", translate("API Key"))
api_key.password = true

-- Browser section
s3 = m:section(TypedSection, "hermes", translate("Browser (Headless)"))
s3.anonymous = true
s3.addremove = false

browser_engine = s3:option(ListValue, "browser_engine", translate("Browser Engine"))
browser_engine:value("none", translate("None (recommended for routers)"))
browser_engine:value("camofox", translate("Camofox"))
browser_engine.default = "none"

-- Advanced
s4 = m:section(TypedSection, "hermes", translate("Advanced"))
s4.anonymous = true
s4.addremove = false

workspace = s4:option(Value, "workspace", translate("Workspace Path"))
workspace.default = "/root/.hermes/workspace"

log_level = s4:option(ListValue, "log_level", translate("Log Level"))
log_level:value("debug", "Debug")
log_level:value("info", "Info")
log_level:value("warning", "Warning")
log_level:value("error", "Error")
log_level.default = "info"

return m
