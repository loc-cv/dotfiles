local M = {}
local hi = require('core.utils').hi
local c = require('vscode.colors')

M.colors = {
  -- Lsp related highlights
  LspSignatureActiveParameter = { underline = true, bold = true },
  DiagnosticUnderlineError = { fg = 'NONE', bg = 'NONE', underline = true, sp = c.vscRed },
  DiagnosticUnderlineWarn = { fg = 'NONE', bg = 'NONE', underline = true, sp = c.vscYellow },
  DiagnosticUnderlineInfo = { fg = 'NONE', bg = 'NONE', underline = true, sp = c.vscBlue },
  DiagnosticUnderlineHint = { fg = 'NONE', bg = 'NONE', underline = true, sp = c.vscBlue },

  -- Floating windows
  NormalFloat = { bg = '#303030' },

  -- Cursorline
  CursorLine = { bg = '#282828' },

  -- Search
  IncSearch = { bg = '#adadad', fg = '#0a0a0a', bold = true },

  -- Fold
  Folded = { bg = '#252526', fg = '#3F3F46', underline = false },

  -- Git
  DiffAdd = { fg = '#458700', bg = 'NONE' },
  DiffChange = { fg = '#007c9f', bg = 'NONE' },
  DiffDelete = { fg = '#db4b4b', bg = 'NONE' },

  -- Tabline
  TabLineFill = { bg = '#282828', fg = '#d4d4d4', bold = true },
  TabLineSel = { bg = '#adadad', fg = '#0a0a0a', bold = true },
  TabLine = { bg = '#373737', fg = '#d4d4d4', bold = true },

  -- Statusline
  StatusLine = { bg = '#1e1e1e' },
  StatusLineNC = { bg = '#1e1e10' },

  -- vim-floaterm
  FloatermBorder = { bg = '#1e1e1e' },

  -- vim-highlightedyank
  HighlightedyankRegion = { bg = '#4f4f4f', bold = true },

  -- indent-blankline.nvim
  IndentBlanklineContextChar = { fg = '#d4d4d4' },
  IndentBlanklineContextStart = { fg = 'NONE', sp = '#d4d4d4', underline = true },

  -- vim-better-whitespace
  ExtraWhitespace = { bg = '#808080' },

  -- nvim-window
  NvimWindow = { bg = '#d4d4d4', fg = '#0a0a0a' },

  -- vim-sandwich
  OperatorSandwichChange = { link = 'Visual' },
  OperatorSandwichAdd = { link = 'Visual' },
  OperatorSandwichDelete = { link = 'Visual' },
}

local colors = M.colors

M.init = function()
  vim.cmd([[colorscheme vscode]])
  vim.o.background = 'dark'
  -- vim.cmd([[colorscheme codedark]])

  for group, conf in pairs(colors) do
    hi(group, conf)
  end
end

return M
