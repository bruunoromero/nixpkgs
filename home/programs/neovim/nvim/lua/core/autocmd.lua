local M = {}

local function get_keys(t)
  local keys = {}
  for key, _ in pairs(t) do
    table.insert(keys, key)
  end

  return keys
end

local function setup_ft_mappings(user)
  local group = vim.api.nvim_create_augroup("filetypemappings", { clear = true })
  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = get_keys(user.ft_mappings),
    callback = function(opts)
      local ok, wk = pcall(require, "which-key")

      if not ok then
        return
      end


      local mappings = user.ft_mappings[vim.bo[opts.buf].filetype]

      wk.register(mappings, { buffer = opts.buf })
    end
  })

end

function M.setup(user)
  setup_ft_mappings(user)
end

return M
