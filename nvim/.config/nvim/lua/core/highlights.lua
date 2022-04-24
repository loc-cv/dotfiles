local hi = vim.api.nvim_set_hl

local colors = {
  -- cursorline
  CursorLine = "#282828",

  -- telescope
  TelescopeSelection = "#323232",

  -- floaterm
  FloatermBorder = "#1e1e1e",

  -- git
  DiffAdd = "#458700",
  DiffChange = "#007c9f",
  DiffDelete = "#db4b4b",

  -- yank region
  HighlightedyankRegion = "#454545",

  -- indent_blankline
  IndentBlanklineContextChar = "#d4d4d4",
  IndentBlanklineContextStart = "#d4d4d4",

  -- trailing whitespaces
  Whitespace = "#808080",

  -- statusline
  GalaxylineActiveFG = "#d4d4d4",
  GalaxylineInactiveFG = "#808080",
  GalaxylineBG = "#323232",
  StatusLine = "#4f4f4f",
  StatusLineNC = "#454545",

  -- coc.nvim
  CocError = "#db4b4b",
  CocWarning = "#e0af68",
  CocInfo = "#0db9d7",
  CocHint = "#10b981",
  CocFadeOut = "#808080",

  -- nvim_window
  NvimWindowFG = "#1e1e1e",
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

return colors
