local M = {}

M.setup = function()
  local ok, ufo = pcall(require, 'ufo')
  if not ok then
    return
  end

  ufo.setup({})
end

return M
