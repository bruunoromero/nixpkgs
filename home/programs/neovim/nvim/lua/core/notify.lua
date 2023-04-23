local M = {}

local function with_level(level)
  return function(user, msg, opts)
    local ok, notify = pcall(require, "notify")

    if not ok or not user.builtin.enabled then
      vim.notify(msg, level, opts)
    else
      notify(msg, level, opts)
    end
  end
end

function M.setup(user)
  local ok, notify = pcall(require, "notify")

  if ok and user.builtin.notify.global then
    vim.notify = notify
  end
end

M.debug = with_level(vim.log.levels.DEBUG)
M.info = with_level(vim.log.levels.INFO)
M.error = with_level(vim.log.levels.ERROR)
M.trace = with_level(vim.log.levels.TRACE)
M.warn = with_level(vim.log.levels.WARN)

return M
