local M = {}
local hi = require("core.utils").hi

M.colors = {
  -- Cursorline
  CursorLine = { bg = "#323232" },

  -- Telescope
  --[[ TelescopeSelection = { bg = "#323232" },
  TelescopePromptBorder = { fg = "#d4d4d4" },
  TelescopeResultsBorder = { fg = "#d4d4d4" },
  TelescopePreviewBorder = { fg = "#d4d4d4" }, ]]

  -- Floaterm
  FloatermBorder = { bg = "#1e1e1e" },

  -- Git
  DiffAdd = { fg = "#458700", bg = "NONE" },
  DiffChange = { fg = "#007c9f", bg = "NONE" },
  DiffDelete = { fg = "#db4b4b", bg = "NONE" },

  -- Neogit
  NeogitDiffAddHighlight = "",
  NeogitDiffDeleteHighlight = "",
  NeogitDiffContextHighlight = "",
  NeogitHunkHeader = "",
  NeogitHunkHeaderHighlight = "",

  -- Yank region
  HighlightedyankRegion = { bg = "#4f4f4f" },

  -- Indent_blankline
  IndentBlanklineContextChar = { fg = "#d4d4d4" },
  IndentBlanklineContextStart = { fg = "NONE", sp = "#d4d4d4" },

  -- Trailing whitespaces
  Whitespace = { bg = "#808080" },

  -- Galaxyline
  GalaxylineActive = { bg = "#adadad", fg = "#0a0a0a" },
  GalaxylineInactive = { bg = "#323232", fg = "#c0c0c0" },

  -- Statusline
  StatusLine = { bg = "#282828", fg = "#d4d4d4" },
  StatusLineNC = { bg = "#272727", fg = "#c0c0c0" },

  -- Tabline
  TabLineFill = { bg = "#282828", fg = "#d4d4d4" },
  TabLineSel = { bg = "#adadad", fg = "#0a0a0a" },
  TabLine = { bg = "#323232", fg = "#c0c0c0" },

  -- CoC
  CocError = { fg = "#db4b4b" },
  CocWarning = { fg = "#e0af68" },
  CocInfo = { fg = "#0db9d7" },
  CocHint = { fg = "#10b981" },
  CocFadeOut = { fg = "#808080" },
  CocHighlightText = { bg = "#282828" },

  -- Nvim_window
  NvimWindow = { bg = "#0a0a0a", fg = "#d4d4d4" },

  -- Vim-sandwich
  OperatorSandwichChange = { bg = "#d4d4d4", fg = "#1e1e1e" },

  -- Vim-searchlight
  Searchlight = { bg = "#adadad", fg = "#0a0a0a" },
}

local colors = M.colors

M.init = function()
  vim.g.vscode_style = "dark"
  vim.cmd [[colorscheme vscode]]

  -- CursorLine
  hi("CursorLine", { bg = colors.CursorLine.bg })

  -- Trailing whitespaces
  vim.g.better_whitespace_guicolor = colors.Whitespace.bg

  -- Telescope
  --[[ hi("TelescopeSelection", { bg = colors.TelescopeSelection.bg, bold = true })
  hi("TelescopePromptBorder", { fg = colors.TelescopePromptBorder.fg })
  hi("TelescopeResultsBorder", { fg = colors.TelescopeResultsBorder.fg })
  hi("TelescopePreviewBorder", { fg = colors.TelescopePreviewBorder.fg }) ]]

  -- Floaterm
  hi("FloatermBorder", { bg = colors.FloatermBorder.bg })

  -- Statusline
  hi("StatusLine", { bg = colors.StatusLine.bg, fg = colors.StatusLine.fg })
  hi("StatusLineNC", { bg = colors.StatusLineNC.bg, fg = colors.StatusLineNC.fg })

  -- Tabline
  hi("TabLine", { bg = colors.TabLine.bg, fg = colors.TabLine.fg, bold = true })
  hi("TabLineSel", { bg = colors.TabLineSel.bg, fg = colors.TabLineSel.fg, bold = true })
  hi("TabLineFill", { bg = colors.TabLineFill.bg, fg = colors.TabLineFill.fg, bold = true })

  -- Git
  hi("DiffAdd", { fg = colors.DiffAdd.fg, bg = colors.DiffAdd.bg })
  hi("DiffChange", { fg = colors.DiffChange.fg, bg = colors.DiffChange.bg })
  hi("DiffDelete", { fg = colors.DiffDelete.fg, bg = colors.DiffDelete.bg })

  -- Yank region
  hi("HighlightedyankRegion", { bg = colors.HighlightedyankRegion.bg, bold = true })

  -- Indent_blankline
  hi("IndentBlanklineContextChar", { fg = colors.IndentBlanklineContextChar.fg })
  hi(
    "IndentBlanklineContextStart",
    { fg = colors.IndentBlanklineContextStart.fg, sp = colors.IndentBlanklineContextStart.sp, underline = true }
  )

  -- CoC
  hi("CocErrorSign", { fg = colors.CocError.fg })
  hi("CocErrorVirtualText", { fg = colors.CocError.fg })
  hi("CocErrorHighlight", { fg = colors.CocError.fg, underline = true })
  hi("CocWarningSign", { fg = colors.CocWarning.fg })
  hi("CocWarningVirtualText", { fg = colors.CocWarning.fg })
  hi("CocWarningHighlight", { fg = colors.CocWarning.fg, underline = true })
  hi("CocInfoSign", { fg = colors.CocInfo.fg })
  hi("CocInfoVirtualText", { fg = colors.CocInfo.fg })
  hi("CocInfoHighlight", { fg = colors.CocInfo.fg, underline = true })
  hi("CocHintSign", { fg = colors.CocHint.fg })
  hi("CocHintVirtualText", { fg = colors.CocHint.fg })
  hi("CocHintHighlight", { fg = colors.CocHint.fg, underline = true })
  hi("CocFadeOut", { fg = colors.CocFadeOut.fg, underline = true })
  hi("CocHighlightText", { bg = colors.CocHighlightText.bg, underline = true })

  -- Nvim-window
  hi("NvimWindow", { fg = colors.NvimWindow.fg, bg = colors.NvimWindow.bg })

  -- Vim-sandwich
  hi("OperatorSandwichChange", { bg = colors.OperatorSandwichChange.bg, fg = colors.OperatorSandwichChange.fg })

  -- Vim-searchlight
  hi("Searchlight", { bg = colors.Searchlight.bg, fg = colors.Searchlight.fg, bold = true })
end

return M
