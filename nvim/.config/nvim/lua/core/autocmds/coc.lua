-- Setup formatexpr specified filetype(s)
-- and update signature help on jump placeholder
vim.cmd [[
  augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
]]

-- Auto close coc-explorer when exit Neovim
vim.cmd [[autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif]]

-- Highlight the symbol and its references when holding the cursor
vim.cmd [[autocmd CursorHold * silent call CocActionAsync('highlight')]]
