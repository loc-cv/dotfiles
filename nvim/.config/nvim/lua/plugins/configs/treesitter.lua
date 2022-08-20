local M = {}

local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
  return
end

M.setup_ts = function()
  treesitter.setup({
    ensure_installed = 'all',

    highlight = {
      enable = true,
      disable = { 'vim', 'html' },
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = false,
    },
  })
end

M.setup_context_commentstring = function()
  treesitter.setup({
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
end

M.setup_autotag = function()
  treesitter.setup({
    autotag = {
      enable = true,
    },
  })
end

return M
