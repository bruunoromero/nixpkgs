pcall(require, "impatient")
pcall(require, "core.bootstrap")
pcall(require, "core.options")
pcall(require, "core.plugins.bootstrap")

local notify = require("core.notify")

local M = {}

local function set_colorscheme(user)
  if user.colorscheme then
    vim.cmd("colorscheme " .. user.colorscheme)
  end
end

local function set_mappings(user)
  local ok, wk = pcall(require, "which-key")

  if not ok then
    return
  end

  wk.register(user.mappings)
end

local function close(user)
  set_colorscheme(user)
  set_mappings(user)
end

function M.setup(open)
  require("core.plugins.builtins")
  local autocmd = require("core.autocmd")
  local commands = require("core.commands")
  local user = require("core.user")
  local plugins = require("core.plugins.startup")

  open(user)
  autocmd.setup(user)
  commands.setup(user)
  notify.setup(user)
  plugins.setup(user)
  close(user)
end

function M.reload(user)
  for name, _ in pairs(package.loaded) do
    if name:match("^user") or name:match("^core") then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  notify.info(user, "Nvim configuration reloaded!")
end

return M
