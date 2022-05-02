local M = {}

M.setup = function()
  -- for coc-fzf
  vim.g.fzf_layout = { window = { height = 0.8, width = 0.8, border = "sharp" } }
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
    "coc-explorer",
    "coc-sumneko-lua",
    -- 'coc-go',
  }
end

return M
