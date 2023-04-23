local M = {}

-- TODO (CORE)
local function setup_mappings()
  local actions = require("telescope.actions")

  return {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  }
end

-- TODO (CORE)
local function on_config_done()
  local telescope = require("telescope")

  telescope.load_extension("fzf")
  telescope.load_extension("projects")
  telescope.load_extension("yabs")
end

function M.setup(user)
  user.plugins.telescope = {
    active = true,
    on_config_done = on_config_done,
    config = function()
      local mappings = setup_mappings()

      return {
        defaults = {
          path_display = { shorten = 4 },
          set_env = { COLORTERM = "truecolor" },
          mappings = {
            i = mappings,
            n = mappings,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      }
    end,
  }
end

return M
