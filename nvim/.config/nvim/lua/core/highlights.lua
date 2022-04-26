local utils = require "core.utils"
local hi = utils.hi

local colors = {
  -- cursorline
  CursorLine = "#323232",

  -- telescope
  -- TelescopeSelectionBG = "#adadad",
  -- TelescopeSelectionFG = "#0a0a0a",
  TelescopeSelectionBG = "#323232",

  -- floaterm
  FloatermBorder = "#1e1e1e",

  -- git
  DiffAdd = "#458700",
  DiffChange = "#007c9f",
  DiffDelete = "#db4b4b",

  -- yank region
  HighlightedyankRegion = "#4f4f4f",

  -- indent_blankline
  IndentBlanklineContextChar = "#d4d4d4",
  IndentBlanklineContextStart = "#d4d4d4",

  -- trailing whitespaces
  Whitespace = "#808080",

  -- galaxyline & statusline
  GalaxylineActiveBG = "#adadad",
  GalaxylineActiveFG = "#0a0a0a",
  StatusLineBG = "#282828",
  StatusLineFG = "#d4d4d4",

  GalaxylineInactiveBG = "#3b3b3b",
  GalaxylineInactiveFG = "#c0c0c0",
  StatusLineNCBG = "#808080",
  StatusLineNCFG = "#c0c0c0",

  -- coc.nvim
  CocError = "#db4b4b",
  CocWarning = "#e0af68",
  CocInfo = "#0db9d7",
  CocHint = "#10b981",
  CocFadeOut = "#808080",
  CocHighlightTextBG = "#282828",

  -- nvim_window
  NvimWindowFG = "#0a0a0a",
  NvimWindowBG = "#d4d4d4",

  -- vim-sandwich
  OperatorSandwichChangeFG = "#1e1e1e",
  OperatorSandwichChangeBG = "#d4d4d4",

  -- pounce.nvim
  PounceMatchFG = "#0a0a0a",
  PounceMatchBG = "#808080",
  PounceGapFG = "#0a0a0a",
  PounceGapBG = "#454545",
  PounceAcceptFG = "#1e1e1e",
  PounceAcceptBG = "#d4d4d4",
}

vim.g.vscode_style = "dark"
vim.cmd [[colorscheme vscode]]

-- CursorLine
hi("CursorLine", { bg = colors.CursorLine })

-- Trailing whitespaces
vim.g.better_whitespace_guicolor = colors.Whitespace

-- Telescope
-- hi("TelescopeSelection", { bg = colors.TelescopeSelectionBG, fg = colors.TelescopeSelectionFG })
hi("TelescopeSelection", { bg = colors.TelescopeSelectionBG })

-- Floaterm
hi("FloatermBorder", { bg = colors.FloatermBorder })

-- Statusline
hi("StatusLine", { bg = colors.StatusLineBG, fg = colors.StatusLineFG })
hi("StatusLineNC", { bg = colors.StatusLineNCBG, fg = colors.StatusLineNCFG })

-- Git
hi("DiffAdd", { fg = colors.DiffAdd, bg = "NONE" })
hi("DiffChange", { fg = colors.DiffChange, bg = "NONE" })
hi("DiffDelete", { fg = colors.DiffDelete, bg = "NONE" })

-- Yank region
hi("HighlightedyankRegion", { bg = colors.HighlightedyankRegion, bold = true })

-- For indent_blankline only
hi("IndentBlanklineContextChar", { fg = colors.IndentBlanklineContextChar })
hi("IndentBlanklineContextStart", { fg = "NONE", sp = colors.IndentBlanklineContextStart, underline = true })

-- coc.nvim
hi("CocErrorSign", { fg = colors.CocError })
hi("CocErrorVirtualText", { fg = colors.CocError })
hi("CocErrorHighlight", { fg = colors.CocError, underline = true })
hi("CocWarningSign", { fg = colors.CocWarning })
hi("CocWarningVirtualText", { fg = colors.CocWarning })
hi("CocWarningHighlight", { fg = colors.CocWarning, underline = true })
hi("CocInfoSign", { fg = colors.CocInfo })
hi("CocInfoVirtualText", { fg = colors.CocInfo })
hi("CocInfoHighlight", { fg = colors.CocInfo, underline = true })
hi("CocHintSign", { fg = colors.CocHint })
hi("CocHintVirtualText", { fg = colors.CocHint })
hi("CocHintHighlight", { fg = colors.CocHint, underline = true })
hi("CocFadeOut", { fg = colors.CocFadeOut, underline = true })
hi("CocHighlightText", { bg = colors.CocHighlightTextBG, underline = true })

-- nvim-window
hi("NvimWindow", { fg = colors.NvimWindowFG, bg = colors.NvimWindowBG })

-- vim-sandwich
hi("OperatorSandwichChange", { bg = colors.OperatorSandwichChangeBG, fg = colors.OperatorSandwichChangeFG })

-- pounce.nvim
hi("PounceMatch", { bg = colors.PounceMatchBG, fg = colors.PounceMatchFG, bold = true })
hi("PounceGap", { bg = colors.PounceGapBG, fg = colors.PounceGapFG, bold = true })
hi("PounceAccept", { bg = colors.PounceAcceptBG, fg = colors.PounceAcceptFG, bold = true })

return colors
