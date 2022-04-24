local M = {}

M.map = function(mode, lhs, rhs, opts)
  local options = { silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

M.hi = function(name, val, ns_id)
  if ns_id then
    vim.api.nvim_set_hl(ns_id, name, val)
  else
    vim.api.nvim_set_hl(0, name, val)
  end
end

return M
