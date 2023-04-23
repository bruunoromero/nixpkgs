local M = {}

local function perform_config_for_user(user, plugin_name)
  local plugin_settings = user[plugin_name]

  if not plugin_settings then
    return
  end

  local require_name = plugin_settings.path or plugin_name
  local func_name = plugin_settings.setup_fn or "setup"

  local config = nil
  local ok, plugin = pcall(require, require_name)

  if not ok then
    return
  end

  if user[plugin_name] ~= nil and user[plugin_name].config ~= nil then
    if type(user[plugin_name].config) == "function" then
      config = user[plugin_name].config()
    else
      config = user[plugin_name].config
    end
  end

  if plugin[func_name] ~= nil then
    plugin[func_name](config)
  end

  if user[plugin_name] ~= nil and user[plugin_name].on_config_done ~= nil then
    user[plugin_name].on_config_done(user)
  end
end

function M.config(plugin_name)
  return "require('core.plugins.utils').perform_config('" .. plugin_name .. "')"
end

function M.perform_config(plugin_name)
  local user = require("core.user")
  perform_config_for_user(user.plugins, plugin_name)
end

return M
