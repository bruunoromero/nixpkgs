local Hydra = require("hydra")

local M = {}

local resize = Hydra({
        name = "Resize Window",
        mode = { "n" },
        hint = [[
 _n_: Narrower _s_: Shorter  _t_: Taller  _w_: Wider
 ^^            _e_: Equalize  _Q_: Close
      ]],
        body = "<C-w>",
        config = {
            hint = {
                border = "rounded"
            },
            invoke_on_body = true,
            color = "pink",
        },
        heads = {
            -- resizing window
            { "n",     "<C-w>3<" },
            { "w",     "<C-w>3>" },
            { "t",     "<C-w>2+" },
            { "s",     "<C-w>2-" },

            -- equalize window sizes
            { "e",     "<C-w>=" },

            -- close active window
            { "Q",     "<Cmd>try | close | catch | endtry<CR>" },

            -- exit this Hydra
            { "q",     nil,                                    { exit = true, nowait = true } },
            { "<Esc>", nil,                                    { exit = true, nowait = true } },
        },
    })



M.spawn = function(head)
  if head == "resize" then
    resize:activate()
  end
end

return M
