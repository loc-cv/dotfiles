local M = {}

M.setup = function()
  local ok, nsurround = pcall(require, 'nvim-surround')
  if not ok then
    return
  end

  nsurround.setup({})
end

return M
