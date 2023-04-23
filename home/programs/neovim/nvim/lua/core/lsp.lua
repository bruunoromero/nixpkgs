local M = {}
_G.LspUtils = {}

vim.g.coc_global_extensions = { "coc-highlight", "coc-yank", "coc-sumneko-lua", "coc-json" }

function LspUtils.on_enter()
  local ok, npairs = pcall(require, "nvim-autopairs")

  if vim.fn["coc#pum#visible"]() ~= 0 then
    return vim.fn["coc#_select_confirm"]()
  else
    if not ok then
      return
    end

    return npairs.autopairs_cr()
  end
end

function M.setup()
  vim.cmd [[set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}]]

  vim.api.nvim_set_keymap("i", "<cr>", 'v:lua.LspUtils.on_enter()', { expr = true, noremap = true })

  vim.cmd [[
    inoremap <silent><expr> <c-space> coc#refresh()
    inoremap <expr> <C-j> coc#pum#visible() ? coc#pum#next(1) : "\<C-j>"
    inoremap <expr> <C-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-k>"
    nnoremap <silent> K :call core#coc#show_documentation()<CR>
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gr <Plug>(coc-references)
  ]]
end

return M
