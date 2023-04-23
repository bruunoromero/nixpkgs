local M = {}

function M.config()
  local if_nil = vim.F.if_nil

  local leader = "SPC"
  local dashboard = require("alpha.themes.dashboard")

  dashboard.section.header.val = {
    "                                                  ",
    " ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗ ",
    " ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║ ",
    " ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║ ",
    " ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║ ",
    " ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║ ",
    " ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝ ",
    "                                                  ",
  }
  local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub(leader, "<leader>")

    local opts = {
      position = "center",
      shortcut = sc,
      cursor = 5,
      width = 50,
      align_shortcut = "right",
      hl_shortcut = "Keyword",
    }
    if keybind then
      keybind_opts = if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
      opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
      local key = vim.api.nvim_replace_termcodes(keybind or sc_ .. "<Ignore>", true, false, true)
      vim.api.nvim_feedkeys(key, "t", false)
    end

    return {
      type = "button",
      val = txt,
      on_press = on_press,
      opts = opts,
    }
  end

  dashboard.section.buttons.val = {
    button("SPC f n", "   New file"),
    button("SPC f f", "   Find file"),
    button("SPC f r", "   Recently used files"),
    button("SPC e p p", "   Update plugins"), -- Packer sync
    button("SPC e q", "   Quit Neovim"),
  }
  dashboard.section.buttons.opts = {
    spacing = 0,
  }

  -- Footer
  local function footer()
    local total_plugins = #vim.tbl_keys(packer_plugins)
    local version = vim.version()
    local nvim_version_info = "  Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return " " .. total_plugins .. " plugins" .. nvim_version_info
  end

  dashboard.section.footer.val = footer()
  dashboard.section.footer.opts.hl = "AlphaFooter"

  -- Layout
  dashboard.config.layout = {
    { type = "padding", val = 1 },
    dashboard.section.header,
    { type = "padding", val = 9 },
    dashboard.section.buttons,
    { type = "padding", val = 1 },
    dashboard.section.footer,
  }

  dashboard.config.opts.noautocmd = true

  return dashboard.opts
end

return M
