local M = {}

local configs = {
  -- coc.nvim
  coc = function()
    -- Add `:Format` command to format current buffer.
    vim.api.nvim_create_user_command('Format', "call CocActionAsync('format')", { nargs = 0, bang = true })

    -- Add `:Fold` command to fold current buffer.
    vim.api.nvim_create_user_command('Fold', "call CocAction('fold', <f-args>)", { nargs = '?', bang = true })

    -- Add `:OR` command for organize imports of the current buffer.
    vim.api.nvim_create_user_command(
      'OR',
      "call CocActionAsync('runCommand', 'editor.action.organizeImport')",
      { nargs = 0, bang = true }
    )

    -- Add `:Prettier` command
    vim.api.nvim_create_user_command('Prettier', 'CocCommand prettier.forceFormatDocument', { nargs = 0, bang = true })
  end,
}

M.init = function()
  -- Load plugins related user cmds
  for _, config in pairs(configs) do
    config()
  end
end

return M
