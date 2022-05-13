local M = {}

local configs = {
  -- CoC
  coc = function()
    -- Add `:Format` command to format current buffer.
    vim.api.nvim_create_user_command("Format", "call CocAction('format')", { nargs = 0 })

    -- Add `:Fold` command to fold current buffer.
    vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = "?" })

    -- Add `:OR` command for organize imports of the current buffer.
    vim.api.nvim_create_user_command(
      "OR",
      "call CocAction('runCommand', 'editor.action.organizeImport')",
      { nargs = 0 }
    )

    -- Add `:Prettier` command
    vim.api.nvim_create_user_command("Prettier", "CocCommand prettier.formatFile", { nargs = 0 })
  end,

  -- Packer
  packer = function()
    local ok, packer = pcall(require, "packer")
    if not ok then
      return
    end

    -- Add Packer commands because we are not loading it at startup
    vim.api.nvim_create_user_command("PackerClean", function()
      require "plugins"
      packer.clean()
    end, {})

    vim.api.nvim_create_user_command("PackerInstall", function()
      require "plugins"
      packer.install()
    end, {})

    vim.api.nvim_create_user_command("PackerCompile", function()
      require "plugins"
      packer.compile()
    end, {})

    vim.api.nvim_create_user_command("PackerStatus", function()
      require "plugins"
      packer.status()
    end, {})

    vim.api.nvim_create_user_command("PackerSync", function()
      require "plugins"
      packer.sync()
    end, {})

    vim.api.nvim_create_user_command("PackerUpdate", function()
      require "plugins"
      packer.update()
    end, {})
  end,
}

M.init = function()
  -- Load plugins related user cmds
  for _, config in pairs(configs) do
    config()
  end
end

return M
