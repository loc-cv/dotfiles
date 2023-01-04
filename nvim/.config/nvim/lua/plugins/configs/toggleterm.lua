local M = {}

local ok, toggleterm = pcall(require, 'toggleterm')
if not ok then
  return
end
local Terminal = require('toggleterm.terminal').Terminal

M.setup = function()
  toggleterm.setup({
    size = function(term)
      if term.direction == 'horizontal' then
        return 15
      elseif term.direction == 'vertical' then
        return vim.o.columns * 0.4
      end
    end,
    direction = 'vertical',
  })

  vim.keymap.set('n', '<C-q>g', '<CMD>lua toggle_lazygit()<CR>', { silent = true })
end

local lazygit = Terminal:new({
  cmd = 'lazygit',
  direction = 'float',
  float_opts = {
    border = 'single',
    winblend = 20,
  },
})

M.toggle_lazygit = function()
  lazygit:toggle()
end

return M
