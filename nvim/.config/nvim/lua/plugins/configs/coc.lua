local M = {}

-- for coc-fzf
vim.g.fzf_layout = { window = { width = 0.9, height = 0.8 } }
vim.g.coc_fzf_preview = "up:60%"

vim.g.coc_global_extensions = {
  "coc-html",
  "coc-css",
  "coc-emmet",
  "coc-tsserver",
  "coc-json",
  "coc-prettier",
  "coc-eslint",
  "coc-snippets",
  "coc-highlight",
  "coc-explorer",
  "coc-sumneko-lua",
}

function M.show_docs()
  local cw = vim.fn.expand "<cword>"
  if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
    vim.cmd("h " .. cw)
  elseif vim.api.nvim_eval "coc#rpc#ready()" then
    vim.fn.CocActionAsync "doHover"
  else
    vim.cmd("!" .. vim.o.keywordprg .. " " .. cw)
  end
end

M.CR = function()
  local _, autopairs = pcall(require, "nvim-autopairs")
  if vim.fn.pumvisible() ~= 0 then
    return vim.fn["coc#_select_confirm"]()
  else
    return autopairs.autopairs_cr()
  end
end

return M
