-- Setup formatexpr specified filetype(s)
-- And update signature help on jump placeholder
vim.cmd [[
  augroup mygroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
]]

-- Highlight the symbol and its references when holding the cursor
vim.cmd [[autocmd CursorHold * silent call CocActionAsync('highlight')]]

-- Add `:Format` command to format current buffer.
vim.cmd [[command! -nargs=0 Format :call CocAction('format')]]

-- Add `:Fold` command to fold current buffer.
vim.cmd [[command! -nargs=? Fold :call CocAction('fold', <f-args>)]]

-- Add `:OR` command for organize imports of the current buffer.
vim.cmd [[command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')]]

-- Auto close coc-explorer when exit Neovim
vim.cmd [[autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif]]

-- Add `:Prettier` command
vim.cmd [[command! -nargs=0 Prettier :CocCommand prettier.formatFile]]
