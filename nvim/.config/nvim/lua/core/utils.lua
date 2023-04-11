local M = {}

M.map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("keep", opts, { silent = true }))
end

M.hi = function(name, val, ns_id)
  ns_id = ns_id or 0
  vim.api.nvim_set_hl(ns_id, name, val)
end

return M
