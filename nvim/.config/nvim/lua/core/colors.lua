-- TODO: make it more managable

local hi = vim.highlight.create

_G.colors = {}

local vscode_dark = {
  -- telescope
  TelescopeSelection = "#3a3a3a",

  -- floaterm
  FloatermBorder = "#1e1e1e",

  -- git
  DiffAdd = "#458700",
  DiffChange = "#007c9f",
  DiffDelete = "#db4b4b",

  -- yank region
  HighlightedyankRegion = "#444444",

  -- indent_blankline
  IndentBlanklineContextChar = "#d4d4d4",

  -- trailing whitespaces
  whitespace = "#808080",

  -- statusline
  galaxyline_bg = "#303030",
  galaxyline_active_fg = "#d4d4d4",
  galaxyline_inactive_fg = "#808080",
  StatusLine = "#444444",
  StatusLineNC = "#444444",

  -- coc.nvim
  coc_error = "#db4b4b",
  coc_warning = "#e0af68",
  coc_info = "#0db9d7",
  coc_hint = "#10b981",
  coc_fadeout = "#808080",

  -- nvim_window
  nvim_window_fg = "#080808",
  nvim_window_bg = "#cecece"
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
vim.g.better_whitespace_guicolor = colors.whitespace

-- Yank region
hi("HighlightedyankRegion", { guibg = colors.HighlightedyankRegion, gui = "bold" })

-- For indent_blankline only
hi("IndentBlanklineContextChar", { guifg = colors.IndentBlanklineContextChar, gui = "nocombine" })

-- coc.nvim
hi("CocErrorSign", { guifg = colors.coc_error })
hi("CocErrorVirtualText", { guifg = colors.coc_error })
hi("CocErrorHighlight", { guifg = colors.coc_error, gui = "underline" })

hi("CocWarningSign", { guifg = colors.coc_warning })
hi("CocWarningVirtualText", { guifg = colors.coc_warning })
hi("CocWarningHighlight", { guifg = colors.coc_warning, gui = "underline" })

hi("CocInfoSign", { guifg = colors.coc_info })
hi("CocInfoVirtualText", { guifg = colors.coc_info })
hi("CocInfoHighlight", { guifg = colors.coc_info, gui = "underline" })

hi("CocHintSign", { guifg = colors.coc_hint })
hi("CocHintVirtualText", { guifg = colors.coc_hint })
hi("CocHintHighlight", { guifg = colors.coc_hint, gui = "underline" })

hi("CocFadeOut", { guifg = colors.coc_fadeout, gui = "underline" })

-- nvim-window
hi("NvimWindow", { guifg = colors.nvim_window_fg, guibg = colors.nvim_window_bg })

return _G.colors
