local M = {}

local function get_terminal()
  local ok, toggleterm = pcall(require, "toggleterm.terminal")

  if not ok then
    return
  end

  return toggleterm.Terminal
end

local function with_terminal(fn)
  local Terminal = get_terminal()

  if not Terminal then
    return
  end

  fn(Terminal)
end

function M.run(cmd)
  with_terminal(function(Terminal)
    if cmd == nil or cmd == "" then
      return
    end

    Terminal:new({ cmd = cmd, hidden = true, close_on_exit = false, direction = "horizontal" }):toggle()
  end)
end

return M
