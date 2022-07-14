local M = {}

M.setup_context_commentstring = function()
  local ok, ts_config = pcall(require, 'nvim-treesitter.configs')
  if not ok then
    return
  end

  ts_config.setup({
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  })
end

M.setup_autotag = function()
  local ok, ts_config = pcall(require, 'nvim-treesitter.configs')
  if not ok then
    return
  end

  ts_config.setup({
    autotag = {
      enable = true,
    },
  })
end

return M
