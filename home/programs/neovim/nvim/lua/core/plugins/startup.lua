local M = {}

function M.setup(user)
  local packer = require("packer")
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
