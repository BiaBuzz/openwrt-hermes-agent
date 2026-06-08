module("luci.controller.hermeswrt", package.seeall)

function index()
    if not nixio.fs.access("/etc/config/hermes") then
        return
    end

    entry({"admin", "services", "hermeswrt"}, cbi("hermeswrt/hermes"), _("HermesWRT"), 60).dependent = true
    entry({"admin", "services", "hermeswrt", "status"}, call("action_status")).leaf = true
end

function action_status()
    local util = require "luci.util"
    local sys = require "luci.sys"

    local running = false
    local pid = util.trim(sys.exec("pidof hermes-runner 2>/dev/null"))
    if pid and pid ~= "" then
        running = true
    end

    local version = util.trim(sys.exec("cat /usr/lib/hermes-agent/version 2>/dev/null") or "unknown")

    luci.http.prepare_content("application/json")
    luci.http.write_json({
        running = running,
        pid = pid,
        version = version
    })
end
