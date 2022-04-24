-- Add `:Format` command to format current buffer.
vim.api.nvim_create_user_command("Format", "call CocAction('format')", { nargs = 0 })

-- Add `:Fold` command to fold current buffer.
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = "?" })

-- Add `:OR` command for organize imports of the current buffer.
vim.api.nvim_create_user_command("OR", "call CocAction('runCommand', 'editor.action.organizeImport')", { nargs = 0 })

-- Add `:Prettier` command
vim.api.nvim_create_user_command("Prettier", "CocCommand prettier.formatFile", { nargs = 0 })
