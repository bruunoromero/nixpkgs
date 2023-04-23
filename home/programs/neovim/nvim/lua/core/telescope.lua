local M = {}

function M.config()
  local ok, actions = pcall(require, "telescope.actions")

  if not ok then
    return
  end

  local mappings = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
  }

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
end

return M
