local M = {}

M.setup = function()
  local ok, cinnamon = pcall(require, 'cinnamon')
  if not ok then
    return
  end

  cinnamon.setup({
    always_scroll = true,
    centered = true,
    default_delay = 2,
  })
end

return M
