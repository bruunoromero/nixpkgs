local config = require("core.config")

config.setup(function(user)
  user.colorscheme = "catppuccin-frappe"

  require("user.plugins").setup(user)
  require("user.yabs").setup(user)
  require("user.mappings").setup(user)
end)
