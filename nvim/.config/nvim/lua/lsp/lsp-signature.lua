local M = {}

M.setup = function()
  local ok, lsp_signature = pcall(require, 'lsp_signature')
  if not ok then
    return
  end

  lsp_signature.setup({
    hint_enable = false,
    handler_opts = { border = 'none' },
  })
end

return M
