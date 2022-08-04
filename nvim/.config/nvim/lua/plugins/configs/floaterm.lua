local M = {}

M.setup = function()
  vim.g.floaterm_wintype = 'float'
  vim.g.floaterm_position = 'topright'
  vim.g.floaterm_title = ' TERMINAL: $1/$2 '
  vim.g.floaterm_width = 0.5
  vim.g.floaterm_height = 0.99
end

return M
