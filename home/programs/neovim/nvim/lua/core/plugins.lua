local M = {}


function M.register(plugins)
  require("core.plugins.register").register(function(_)
    return plugins
  end)
end

return M
