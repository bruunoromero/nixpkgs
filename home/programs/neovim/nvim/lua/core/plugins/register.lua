local M = {}

local registers = {}

function M.register(fn)
  table.insert(registers, fn)
end

local function build_registry(user)
  local registry = {}

  for _, register in pairs(registers) do
    registry = vim.tbl_extend("force", registry, register(user))
  end

  return registry
end

function M.get_registry(user)
  local registry = build_registry(user)

  return function(use)
    for name, opts in pairs(registry) do
      local plugin = opts
      table.insert(plugin, name)
      use(plugin)
    end
  end
end

return M
