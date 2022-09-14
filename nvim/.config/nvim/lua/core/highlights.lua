local M = {}
local hi = require('core.utils').hi

M.colors = {
  -- Cursorline
  CursorLine = { bg = '#303030' },

  -- Float / Popup
  FloatBorder = { bg = 'NONE' },
  -- Pmenu = { bg = 'NONE' },

  -- Search
  IncSearch = { bg = '#adadad', fg = '#0a0a0a', bold = true },

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
  StatusLineNC = { bg = '#1e1e1e' },

  -- vim-floaterm
  FloatermBorder = { bg = '#1e1e1e' },

  -- vim-highlightedyank
  HighlightedyankRegion = { bg = '#4f4f4f', bold = true },

  -- indent-blankline.nvim
  IndentBlanklineContextChar = { fg = '#d4d4d4' },
  IndentBlanklineContextStart = { fg = 'NONE', sp = '#d4d4d4', underline = true },

  -- vim-better-whitespace
  ExtraWhitespace = { bg = '#808080' },

  -- coc.nvim
  CocErrorSign = { fg = '#db4b4b' },
  CocErrorVirtualText = { fg = '#db4b4b' },
  CocErrorHighlight = { fg = '#db4b4b', underline = true },
  CocWarningSign = { fg = '#e0af68' },
  CocWarningVirtualText = { fg = '#e0af68' },
  CocWarningHighlight = { fg = '#e0af68', underline = true },
  CocInfoSign = { fg = '#0db9d7' },
  CocInfoVirtualText = { fg = '#0db9d7' },
  CocInfoHighlight = { fg = '#0db9d7', underline = true },
  CocHintSign = { fg = '#10b981' },
  CocHintVirtualText = { fg = '#10b981' },
  CocHintHighlight = { fg = '#10b981', underline = true },
  CocFadeOut = { fg = '#808080', underline = true },
  CocHighlightText = { bg = '#282828', underline = true },
  CocSearch = { fg = '#18a2fe' },

  -- nvim-window
  NvimWindow = { bg = '#d4d4d4', fg = '#0a0a0a' },

  -- vim-sandwich
  OperatorSandwichChange = { link = 'Visual' },
  OperatorSandwichAdd = { link = 'Visual' },
  OperatorSandwichDelete = { link = 'Visual' },
}

local colors = M.colors

M.init = function()
  vim.cmd([[colorscheme codedark]])

  for group, conf in pairs(colors) do
    hi(group, conf)
  end
end

return M
