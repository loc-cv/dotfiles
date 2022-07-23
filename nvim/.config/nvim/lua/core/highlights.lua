local M = {}
local hi = require('core.utils').hi

M.colors = {
  -- Lsp related highlights
  DiagnosticUnderlineHint = { underline = true },
  DiagnosticUnderlineWarn = { underline = true },
  DiagnosticUnderlineInfo = { underline = true },
  DiagnosticUnderlineError = { underline = true },
  LspSignatureActiveParameter = { underline = true, bold = true },

  -- Cursorline
  CursorLine = { bg = '#282828' },

  -- FloatBorder
  FloatBorder = { bg = 'NONE' },

  -- Search
  IncSearch = { bg = '#adadad', fg = '#0a0a0a', bold = true },
  Searchlight = { link = 'IncSearch' }, -- vim-searchlight

  -- Git
  DiffAdd = { fg = '#458700', bg = 'NONE' },
  DiffChange = { fg = '#007c9f', bg = 'NONE' },
  DiffDelete = { fg = '#db4b4b', bg = 'NONE' },

  -- Statusline
  -- StatusLine = { bg = '#282828', fg = '#d4d4d4' },
  -- StatusLineNC = { bg = '#272727', fg = '#d4d4d4' },
  -- StatusLine = { bg = '#adadad', fg = '#0a0a0a' },
  -- StatusLineNC = { bg = '#323232', fg = '#c0c0c0' },

  -- Tabline
  TabLineFill = { bg = '#282828', fg = '#d4d4d4', bold = true },
  TabLineSel = { bg = '#adadad', fg = '#0a0a0a', bold = true },
  TabLine = { bg = '#323232', fg = '#c0c0c0', bold = true },

  -- vim-floaterm
  FloatermBorder = { bg = '#1e1e1e' },

  -- vim-highlightedyank
  HighlightedyankRegion = { bg = '#4f4f4f', bold = true },

  -- indent-blankline.nvim
  IndentBlanklineContextChar = { fg = '#d4d4d4' },
  IndentBlanklineContextStart = { fg = 'NONE', sp = '#d4d4d4', underline = true },

  -- vim-better-whitespace
  ExtraWhitespace = { bg = '#808080' },

  -- galaxyline.nvim
  GalaxylineActive = { bg = '#adadad', fg = '#0a0a0a' },
  GalaxylineInactive = { bg = '#323232', fg = '#c0c0c0' },

  -- nvim-window
  NvimWindow = { bg = '#d4d4d4', fg = '#0a0a0a' },
}

local colors = M.colors

M.init = function()
  vim.g.vscode_style = 'dark'
  vim.cmd([[colorscheme vscode]])

  for group, conf in pairs(colors) do
    hi(group, conf)
  end
end

return M
