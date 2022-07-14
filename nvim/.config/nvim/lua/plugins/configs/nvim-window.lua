local M = {}

M.setup = function()
  local ok, nw = pcall(require, 'nvim-window')
  if not ok then
    return
  end

  nw.setup({
    normal_hl = 'NvimWindow',
    hint_hl = 'Bold',
    border = 'none',
  })
end

return M
