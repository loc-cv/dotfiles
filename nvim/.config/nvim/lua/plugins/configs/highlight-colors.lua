local M = {}

M.setup = function()
  local ok, highlight_color = pcall(require, 'nvim-highlight-colors')
  if not ok then
    return
  end

  highlight_color.setup({
    render = 'background',
    enable_named_color = true,
    enable_tailwind = true,
  })
end

return M
