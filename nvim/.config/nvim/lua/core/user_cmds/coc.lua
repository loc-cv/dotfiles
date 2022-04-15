-- Add `:Format` command to format current buffer.
vim.cmd [[command! -nargs=0 Format :call CocAction('format')]]

-- Add `:Fold` command to fold current buffer.
vim.cmd [[command! -nargs=? Fold :call CocAction('fold', <f-args>)]]

-- Add `:OR` command for organize imports of the current buffer.
vim.cmd [[command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')]]

-- Add `:Prettier` command
vim.cmd [[command! -nargs=0 Prettier :CocCommand prettier.formatFile]]
