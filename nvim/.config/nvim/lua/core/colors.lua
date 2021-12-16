-- TODO: make it more managable
local hi = vim.highlight.create

_G.colors = {}

local vscode_dark = {
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

  -- trailing whitespaces
  Whitespace = "#808080",

  -- statusline
  GalaxylineBG = "#323232",
  GalaxylineActiveFG = "#d4d4d4",
  GalaxylineInactiveFG = "#808080",
  StatusLine = "#454545",
  StatusLineNC = "#454545",

  -- coc.nvim
  CocError = "#db4b4b",
  CocWarning = "#e0af68",
  CocInfo = "#0db9d7",
  CocHint = "#10b981",
  CocFadeOut = "#808080",

  -- nvim_window
  NvimWindowBG = "#d4d4d4",
  NvimWindowFG = "#0a0a0a",
}

local set_colors = function(colorscheme, style)
  if colorscheme == "vscode" then
    if style then
      vim.g.vscode_style = style
    else
      vim.g.vscode_style = "dark"
    end
    vim.cmd("colorscheme " .. colorscheme)
    _G.colors = vscode_dark
  end
end

set_colors "vscode"

-- Telescope
hi("TelescopeSelection", { guibg = colors.TelescopeSelection })

-- Floaterm
hi("FloatermBorder", { guibg = colors.FloatermBorder })

-- Statusline
hi("StatusLine", { guibg = colors.StatusLine })
hi("StatusLineNC", { guibg = colors.StatusLineNC })

-- Git
hi("DiffAdd", { guifg = colors.DiffAdd, guibg = "NONE" })
hi("DiffChange", { guifg = colors.DiffChange, guibg = "NONE" })
hi("DiffDelete", { guifg = colors.DiffDelete, guibg = "NONE" })

-- Trailing whitespaces
vim.g.better_whitespace_guicolor = colors.Whitespace

-- Yank region
hi("HighlightedyankRegion", { guibg = colors.HighlightedyankRegion, gui = "bold" })

-- For indent_blankline only
hi("IndentBlanklineContextChar", { guifg = colors.IndentBlanklineContextChar, gui = "nocombine" })

-- coc.nvim
hi("CocErrorSign", { guifg = colors.CocError })
hi("CocErrorVirtualText", { guifg = colors.CocError })
hi("CocErrorHighlight", { guifg = colors.CocError, gui = "underline" })

hi("CocWarningSign", { guifg = colors.CocWarning })
hi("CocWarningVirtualText", { guifg = colors.CocWarning })
hi("CocWarningHighlight", { guifg = colors.CocWarning, gui = "underline" })

hi("CocInfoSign", { guifg = colors.CocInfo })
hi("CocInfoVirtualText", { guifg = colors.CocInfo })
hi("CocInfoHighlight", { guifg = colors.CocInfo, gui = "underline" })

hi("CocHintSign", { guifg = colors.CocHint })
hi("CocHintVirtualText", { guifg = colors.CocHint })
hi("CocHintHighlight", { guifg = colors.CocHint, gui = "underline" })

hi("CocFadeOut", { guifg = colors.CocFadeOut, gui = "underline" })

-- nvim-window
hi("NvimWindow", { guifg = colors.NvimWindowFG, guibg = colors.NvimWindowBG })

return _G.colors
