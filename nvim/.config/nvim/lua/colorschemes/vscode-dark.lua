local M = {}
local hi = require('core.utils').hi

local colors = {
  -- Cursorline
  CursorLine = { bg = '#303030' },
  NvimTreeCursorLine = { link = 'Cursorline' },

  -- Fold
  Folded = { bg = '#252526', fg = '#3F3F46', underline = false },

  -- Git
  DiffAdd = { fg = '#458700', bg = 'NONE' },
  DiffChange = { fg = '#007c9f', bg = 'NONE' },
  DiffDelete = { fg = '#db4b4b', bg = 'NONE' },

  -- Tabline
  TabLineFill = { bg = '#282828', fg = '#d4d4d4' },
  TabLineSel = { bg = '#f5f5f5', fg = '#343434' },
  TabLine = { bg = '#373737', fg = '#ffffff' },

  -- Statusline
  StatusLine = { bg = '#1e1e1e' },
  StatusLineNC = { bg = '#1e1e10' },

  -- vim-floaterm
  FloatermBorder = { bg = '#1e1e1e' },

  -- vim-highlightedyank
  HighlightedyankRegion = { bg = '#4f4f4f' },

  -- indent-blankline.nvim
  IndentBlanklineContextChar = { fg = '#d4d4d4' },
  IndentBlanklineContextStart = { fg = 'NONE', sp = '#d4d4d4', underline = true },

  -- vim-better-whitespace
  ExtraWhitespace = { bg = '#808080' },

  -- telescope.nvim
  TelescopeResultsBorder = { link = 'Normal' },
  TelescopePromptBorder = { link = 'Normal' },
  TelescopePreviewBorder = { link = 'Normal' },

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
  CocSymbolLineSeparator = { link = 'Normal' },

  -- vim-sandwich
  OperatorSandwichChange = { link = 'Visual' },
  OperatorSandwichAdd = { link = 'Visual' },
  OperatorSandwichDelete = { link = 'Visual' },
}

M.colors_statusline = {
  active = { fg = '#ffffff', bg = '#0a7aca', style = 'NONE' },
  inactive = { fg = '#ffffff', bg = '#373737', style = 'NONE' },
}

M.setup = function()
  vim.o.background = 'dark'
  vim.g.vscode_disable_nvim_tree_bg = 1
  require('vscode').setup({})
  vim.cmd({ cmd = 'colorscheme', args = { 'vscode' } })

  for group, conf in pairs(colors) do
    hi(group, conf)
  end
end

return M
