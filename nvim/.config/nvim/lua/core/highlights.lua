local hi = vim.api.nvim_set_hl
local colorschemes = require "colorschemes"

_G.colors = {}

local set_colors = function(colorscheme, style)
  if colorscheme == "vscode" then
    if style then
      vim.g.vscode_style = style
      _G.colors = colorschemes["vscode_" .. style]
    else
      vim.g.vscode_style = "dark"
      _G.colors = colorschemes.vscode_dark
    end
  end
  -- more colorschemes ...
  -- ...
  vim.cmd("colorscheme " .. colorscheme)
end

set_colors "vscode"
-- set_colors('vscode', 'light')

-- CursorLine
hi(0, "CursorLine", { bg = colors.CursorLine })

-- Trailing whitespaces
vim.g.better_whitespace_guicolor = colors.Whitespace

-- Telescope
hi(0, "TelescopeSelection", { bg = colors.TelescopeSelection })

-- Floaterm
hi(0, "FloatermBorder", { bg = colors.FloatermBorder })

-- Statusline
hi(0, "StatusLine", { bg = colors.StatusLine })
hi(0, "StatusLineNC", { bg = colors.StatusLineNC })

-- Git
hi(0, "DiffAdd", { fg = colors.DiffAdd, bg = "NONE" })
hi(0, "DiffChange", { fg = colors.DiffChange, bg = "NONE" })
hi(0, "DiffDelete", { fg = colors.DiffDelete, bg = "NONE" })

-- Yank region
hi(0, "HighlightedyankRegion", { bg = colors.HighlightedyankRegion, bold = true })

-- For indent_blankline only
hi(0, "IndentBlanklineContextChar", { fg = colors.IndentBlanklineContextChar })
hi(0, "IndentBlanklineContextStart", { fg = "NONE", sp = colors.IndentBlanklineContextStart, underline = true })

-- coc.nvim
hi(0, "CocErrorSign", { fg = colors.CocError })
hi(0, "CocErrorVirtualText", { fg = colors.CocError })
hi(0, "CocErrorHighlight", { fg = colors.CocError, underline = true })

hi(0, "CocWarningSign", { fg = colors.CocWarning })
hi(0, "CocWarningVirtualText", { fg = colors.CocWarning })
hi(0, "CocWarningHighlight", { fg = colors.CocWarning, underline = true })

hi(0, "CocInfoSign", { fg = colors.CocInfo })
hi(0, "CocInfoVirtualText", { fg = colors.CocInfo })
hi(0, "CocInfoHighlight", { fg = colors.CocInfo, underline = true })

hi(0, "CocHintSign", { fg = colors.CocHint })
hi(0, "CocHintVirtualText", { fg = colors.CocHint })
hi(0, "CocHintHighlight", { fg = colors.CocHint, underline = true })

hi(0, "CocFadeOut", { fg = colors.CocFadeOut, underline = true })

-- nvim-window
hi(0, "NvimWindow", { fg = colors.NvimWindowFG, bg = colors.NvimWindowBG })

-- vim-sandwich
hi(0, "OperatorSandwichChange", { bg = colors.OperatorSandwichChangeBG, fg = colors.OperatorSandwichChangeFG })

-- pounce.nvim
hi(0, "PounceMatch", { bg = colors.PounceMatchBG, fg = colors.PounceMatchFG, bold = true })
hi(0, "PounceGap", { bg = colors.PounceGapBG, fg = colors.PounceGapFG, bold = true })
hi(0, "PounceAccept", { bg = colors.PounceAcceptBG, fg = colors.PounceAcceptFG, bold = true })

return _G.colors
