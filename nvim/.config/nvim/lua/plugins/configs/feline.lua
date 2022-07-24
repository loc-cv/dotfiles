local M = {}

M.setup = function()
  local ok, feline = pcall(require, 'feline')
  if not ok then
    return
  end

  feline.setup({})
end

return M
