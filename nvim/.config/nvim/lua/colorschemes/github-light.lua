local M = {}
local hi = require('core.utils').hi

local colors = {
  ExtraWhitespace = { bg = '#cb2431' },
  CocSymbolLineSeparator = { fg = '#24292f' },
  CocSymbolLineEllipsis = { fg = '#24292f' },
}

M.colors_statusline = {
  active = { bg = '#0378d6', fg = '#ffffff', style = 'bold' },
  inactive = { bg = '#d5ddf6', fg = '#24292f', style = 'bold' },
}

M.setup = function()
  local ok, github_theme = pcall(require, 'github-theme')
  if not ok then
    return
  end

  for group, conf in pairs(colors) do
    hi(group, conf)
  end

  github_theme.setup({
    theme_style = 'light',
    comment_style = 'NONE',
    keyword_style = 'NONE',
    hide_inactive_statusline = false,
    sidebars = { 'coc-explorer', 'coctree', 'packer' },
    overrides = function(c)
      return {
        StatusLine = { fg = 'NONE', bg = 'NONE' },
        StatusLineNC = { fg = 'NONE', bg = 'NONE' },
        NonText = { fg = c.syntax.comment },
      }
    end,
  })
end

return M
