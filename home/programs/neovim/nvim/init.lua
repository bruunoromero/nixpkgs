local config = require("core.config")

config.setup(function(user)
  local pomodoro = require("user.pomodoro")
  pomodoro.setup({
    on_work_complete = function()
      pomodoro.show_menu()
    end,
    on_break_complete = function()
      pomodoro.show_menu()
    end
  })

  user.colorscheme = "catppuccin-frappe"
  user.plugins.lualine.config.sections.lualine_x = { pomodoro.status }
  --
  require("user.plugins").setup(user)
  require("user.yabs").setup(user)
  require("user.mappings").setup(user)
end)
