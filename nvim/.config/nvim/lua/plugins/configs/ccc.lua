local M = {}

M.setup = function()
  local ok, ccc = pcall(require, 'ccc')
  if not ok then
    return
  end

  ccc.setup({
    win_opts = {
      border = 'single',
    },
    hl_group = 'Normal',
  })
end

return M
