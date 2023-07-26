local M = {}

function M.setup(user)
  local ok, packer = pcall(require, "packer")

  if not ok then
    return
  end

  local core = require("core.bootstrap")
  local register = require("core.plugins.register")

  local registry = register.get_registry(user)

  packer.init(core.packer.config)

  packer.startup(function(use)
    use({ "wbthomason/packer.nvim", opt = false })

    registry(use)

    if core.packer.bootstrap then
      packer.sync()
    end
  end)
end

return M
