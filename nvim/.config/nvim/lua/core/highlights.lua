local M = {}
local hi = require("core.utils").hi

M.colors = {
  -- Cursorline
  CursorLine = "#323232",

  -- Telescope
  -- TelescopeSelectionBG = "#323232",
  -- TelescopePromptBorderFG = "#d4d4d4",
  -- TelescopeResultsBorderFG = "#d4d4d4",
  -- TelescopePreviewBorderFG = "#d4d4d4",

  -- Floaterm
  FloatermBorder = "#1e1e1e",

  -- Git
  DiffAdd = "#458700",
  DiffChange = "#007c9f",
  DiffDelete = "#db4b4b",

  -- Yank region
  HighlightedyankRegion = "#4f4f4f",

  -- Indent_blankline
  IndentBlanklineContextChar = "#d4d4d4",
  IndentBlanklineContextStart = "#d4d4d4",

  -- Trailing whitespaces
  Whitespace = "#808080",

  -- Galaxyline
  GalaxylineActiveBG = "#adadad",
  GalaxylineActiveFG = "#0a0a0a",
  GalaxylineInactiveBG = "#323232",
  GalaxylineInactiveFG = "#c0c0c0",

  -- Statusline
  StatusLineBG = "#282828",
  StatusLineFG = "#d4d4d4",
  StatusLineNCBG = "#272727",
  StatusLineNCFG = "#c0c0c0",

  -- CoC
  CocError = "#db4b4b",
  CocWarning = "#e0af68",
  CocInfo = "#0db9d7",
  CocHint = "#10b981",
  CocFadeOut = "#808080",
  CocHighlightTextBG = "#282828",

  -- Nvim_window
  NvimWindowFG = "#0a0a0a",
  NvimWindowBG = "#d4d4d4",

  -- Vim-sandwich
  OperatorSandwichChangeFG = "#1e1e1e",
  OperatorSandwichChangeBG = "#d4d4d4",

  -- Pounce.nvim
  PounceMatchFG = "#0a0a0a",
  PounceMatchBG = "#808080",
  PounceGapFG = "#0a0a0a",
  PounceGapBG = "#454545",
  PounceAcceptFG = "#1e1e1e",
  PounceAcceptBG = "#d4d4d4",

  -- Vim-searchlight
  SearchlightBG = "#adadad",
  SearchlightFG = "#0a0a0a",
}

local colors = M.colors

M.init = function()
  vim.g.vscode_style = "dark"
  vim.cmd [[colorscheme vscode]]

  -- CursorLine
  hi("CursorLine", { bg = colors.CursorLine })

  -- Trailing whitespaces
  vim.g.better_whitespace_guicolor = colors.Whitespace

  -- Telescope
  -- hi("TelescopeSelection", { bg = colors.TelescopeSelectionBG, bold = true })
  -- hi("TelescopePromptBorder", { fg = colors.TelescopePromptBorderFG })
  -- hi("TelescopeResultsBorder", { fg = colors.TelescopeResultsBorderFG })
  -- hi("TelescopePreviewBorder", { fg = colors.TelescopePreviewBorderFG })

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

  -- Indent_blankline
  hi("IndentBlanklineContextChar", { fg = colors.IndentBlanklineContextChar })
  hi("IndentBlanklineContextStart", { fg = "NONE", sp = colors.IndentBlanklineContextStart, underline = true })

  -- CoC
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

  -- Nvim-window
  hi("NvimWindow", { fg = colors.NvimWindowFG, bg = colors.NvimWindowBG })

  -- Vim-sandwich
  hi("OperatorSandwichChange", { bg = colors.OperatorSandwichChangeBG, fg = colors.OperatorSandwichChangeFG })

  -- Pounce.nvim
  hi("PounceMatch", { bg = colors.PounceMatchBG, fg = colors.PounceMatchFG, bold = true })
  hi("PounceGap", { bg = colors.PounceGapBG, fg = colors.PounceGapFG, bold = true })
  hi("PounceAccept", { bg = colors.PounceAcceptBG, fg = colors.PounceAcceptFG, bold = true })

  -- Vim-searchlight
  hi("Searchlight", { bg = colors.SearchlightBG, fg = colors.SearchlightFG, bold = true })
end

return M
