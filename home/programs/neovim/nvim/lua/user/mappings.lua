local M = {}

function M.setup(user)
  local nu = require("user.nu")
  local yabs = require("user.yabs")

  user.ft_mappings["http"] = {
    ["<localleader>"] = {
      r = { "<Plug>RestNvim", "Make request" }
    }
  }

  user.mappings["<leader>"]["w"]["w"] = {
    "<cmd>wincmd w<cr>",
    "Cycle window"
  }

  user.mappings["<C-w>"] = {
    function()
      require("user.hydra").spawn("resize")
    end,
    "Resize windows"
  }

  user.mappings["<leader>"]["f"]["r"] = {
    "<cmd>Telescope frecency<cr>",
    "Recent files"
  }

  user.mappings["<leader>"]["n"] = {
    name = "note",
    f = { "<cmd>ZkNotes<cr>", "Find note" },
    n = { "<cmd>ZkNew<cr>", "New note" }
  }

  user.mappings["<leader>"]["N"] = {
    name = "nubank",
    a = {
      name = "aws",
      r = { nu.aws_credentials_refresh.run, "Refresh credentials" },
      m = { nu.aws_credentials_refresh_maven.run, "Refresh maven credentials" }
    },
    p = { nu.proj_clone.run, "Project clone" },
    t = {
      name = "task",
      i = { nu.integration.run, "Run integration tests" },
      l = { nu.lint.run, "Run lint" },
      L = { nu.lint_fix.run, "Run lint-fix" },
      t = { yabs.clojure.test.run, "Run all tests" },
      u = { nu.unit.run, "Run unit tests" },
    },
    u = { nu.update.run, "Update nucli" },
  }

  user.mappings["<leader>"]["t"]["p"] = {
    name = "pomodoro",
    b = { "<cmd>PomodoroBreak<cr>", "Break" },
    p = { "<cmd>PomodoroWork<cr>", "Start" },
    P = { "<cmd>PomodoroStop<cr>", "Stop" },
    s = { "<cmd>PomodoroStatus<cr>", "Status" }
  }

  user.mappings["<leader>"]["s"] = {
    name = "search",
    t = { "<cmd>TodoTelescope<cr>", "Search todo's" },
    r = { "<cmd>lua require('spectre').open()<cr>", "Search and replace" },
    e = { "<cmd>IconPickerNormal<cr>", "Search emoji" }
  }
end

return M
