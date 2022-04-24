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
