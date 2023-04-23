local yabs = require("core.yabs")

local M = {}

local clojure = {
  test = yabs.task("test", "lein test"),
}

local go = {
  run = yabs.task("run", "go run ."),
}

function M.setup(user)
  local nu = require("user.nu")

  user.plugins.yabs.config = {
    languages = {
      go = {
        tasks = {
          [go.run.name] = go.run.task,
        },
      },
      clojure = {
        tasks = {
          [clojure.test.name] = clojure.test.task,
          [nu.unit.name] = nu.unit.task,
          [nu.lint.name] = nu.lint.task,
          [nu.lint_fix.name] = nu.lint_fix.task,
          [nu.integration.name] = nu.integration.task,
        },
      },
    },
    tasks = {
      [nu.update.name] = nu.update.task,
      [nu.proj_clone.name] = nu.proj_clone.task,
      [nu.aws_credentials_refresh.name] = nu.aws_credentials_refresh.task,
      [nu.aws_credentials_refresh_maven.name] = nu.aws_credentials_refresh_maven.task,
    },
  }
end

M.clojure = clojure

return M
