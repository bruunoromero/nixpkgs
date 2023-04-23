local yabs = require("core.yabs")

local M = {}

local function proj_clone_cmd()
  local name = vim.fn.input("Project: ", "")

  if name == "" then
    return ""
  end

  return "nu proj clone " .. name
end

M.proj_clone = yabs.task("nu:clone", proj_clone_cmd)
M.update = yabs.task("nu:update", "nu update")

M.aws_credentials_refresh = yabs.task("nu:aws:credentials-refresh", "nu aws credentials refresh")
M.aws_credentials_refresh_maven = yabs.task(
  "nu:aws:credentials-refresh-maven",
  "nu aws credentials refresh --maven-login"
)

M.unit = yabs.task("nu:lein:unit", "lein unit")
M.lint = yabs.task("nu:lein:lint", "lein lint")
M.lint_fix = yabs.task("nu:lein:lint-fix", "lein lint-fix")
M.integration = yabs.task("nu:lein:integration", "lein integration")

return M
