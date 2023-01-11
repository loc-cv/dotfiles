local M = {}

M.setup = function()
  local ok, persisted = pcall(require, 'persisted')
  if not ok then
    return
  end

  persisted.setup({
    autoload = true,
    before_save = function()
      pcall(vim.cmd, 'NvimTreeClose')
    end,
  })

  require('telescope').load_extension('persisted')
end

return M
