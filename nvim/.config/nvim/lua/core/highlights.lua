local hi = vim.highlight.create
local colorschemes = require 'colorschemes'

_G.colors = {}

local set_colors = function(colorscheme, style)
  if colorscheme == 'vscode' then
    if style then
      vim.g.vscode_style = style
    else
      vim.g.vscode_style = 'dark'
    end
    vim.cmd('colorscheme ' .. colorscheme)
    _G.colors = colorschemes.vscode_dark
  end
  -- more colorschemes ...
end

set_colors 'vscode'

-- CursorLine
hi('CursorLine', { guibg = colors.CursorLine })

-- Trailing whitespaces
vim.g.better_whitespace_guicolor = colors.Whitespace

-- Telescope
hi('TelescopeSelection', { guibg = colors.TelescopeSelection })

-- Floaterm
hi('FloatermBorder', { guibg = colors.FloatermBorder })

-- Statusline
hi('StatusLine', { guibg = colors.StatusLine })
hi('StatusLineNC', { guibg = colors.StatusLineNC })

-- Git
hi('DiffAdd', { guifg = colors.DiffAdd, guibg = 'NONE' })
hi('DiffChange', { guifg = colors.DiffChange, guibg = 'NONE' })
hi('DiffDelete', { guifg = colors.DiffDelete, guibg = 'NONE' })

-- Yank region
hi('HighlightedyankRegion', { guibg = colors.HighlightedyankRegion, gui = 'bold' })

-- For indent_blankline only
hi('IndentBlanklineContextChar', { guifg = colors.IndentBlanklineContextChar, gui = 'nocombine' })
hi('IndentBlanklineContextStart', { guifg = 'NONE', guisp = colors.IndentBlanklineContextStart, gui = 'underline' })

-- coc.nvim
hi('CocErrorSign', { guifg = colors.CocError })
hi('CocErrorVirtualText', { guifg = colors.CocError })
hi('CocErrorHighlight', { guifg = colors.CocError, gui = 'underline' })

hi('CocWarningSign', { guifg = colors.CocWarning })
hi('CocWarningVirtualText', { guifg = colors.CocWarning })
hi('CocWarningHighlight', { guifg = colors.CocWarning, gui = 'underline' })

hi('CocInfoSign', { guifg = colors.CocInfo })
hi('CocInfoVirtualText', { guifg = colors.CocInfo })
hi('CocInfoHighlight', { guifg = colors.CocInfo, gui = 'underline' })

hi('CocHintSign', { guifg = colors.CocHint })
hi('CocHintVirtualText', { guifg = colors.CocHint })
hi('CocHintHighlight', { guifg = colors.CocHint, gui = 'underline' })

hi('CocFadeOut', { guifg = colors.CocFadeOut, gui = 'underline' })

-- nvim-window
hi('NvimWindow', { guifg = colors.NvimWindowFG, guibg = colors.NvimWindowBG })

-- vim-sandwich
hi('OperatorSandwichChange', { guibg = colors.OperatorSandwichChangeBG, guifg = colors.OperatorSandwichChangeFG })

-- pounce.nvim
hi('PounceMatch', { guibg = colors.PounceMatchBG, guifg = colors.PounceMatchFG, gui = 'bold' })
hi('PounceGap', { guibg = colors.PounceGapBG, guifg = colors.PounceGapFG, gui = 'bold' })
hi('PounceAccept', { guibg = colors.PounceAcceptBG, guifg = colors.PounceAcceptFG, gui = 'bold' })

return _G.colors
