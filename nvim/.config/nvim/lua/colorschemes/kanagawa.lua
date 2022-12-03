local M = {}
local hi = require('core.utils').hi

local colors = {}

M.colors_statusline = {
  active = { fg = '#16161D', bg = '#A3D4D5', style = 'bold' },
  inactive = { fg = '#7E9CD8', bg = '#2A2A37', style = 'bold' },
}

M.setup = function()
  local ok, kanagawa = pcall(require, 'kanagawa')
  if not ok then
    return
  end
  local default_colors = require('kanagawa.colors').setup()

  kanagawa.setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = false },
    specialReturn = true, -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = false, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    globalStatus = false, -- adjust window separators highlight for laststatus=3
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = {},
    overrides = {
      DiffAdd = { fg = default_colors.autumnGreen, bg = 'NONE' },
      DiffChange = { fg = default_colors.autumnYellow, bg = 'NONE' },
      DiffDelete = { fg = default_colors.autumnRed, bg = 'NONE' },
    },
    theme = 'default', -- Load "default" theme or the experimental "light" theme
  })

  vim.cmd('colorscheme kanagawa')

  for group, conf in pairs(colors) do
    hi(group, conf)
  end
end

return M
