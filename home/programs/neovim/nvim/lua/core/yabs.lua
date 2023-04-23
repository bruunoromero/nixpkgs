local M = {}

function M.setup(opts)
  local ok, yabs = pcall(require, "yabs")

  if not ok then
    return
  end

  yabs:setup(opts)
end

function M.task(name, cmd)
  local terminal = require("core.terminal")

  local function run()
    local yabs = require("yabs")

    yabs:run_task(name)
  end

  return {
    name = name,
    run = run,
    task = {
      command = cmd,
      output = terminal.run
    }
  }

end

return M
