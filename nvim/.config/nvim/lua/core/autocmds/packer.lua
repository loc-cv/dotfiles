-- Auto compile/clean/install plugins with packer-nvim
local augroup = vim.api.nvim_create_augroup("PackerUserConfig", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup,
  pattern = "*/lua/plugins/init.lua",
  command = "source <afile> | PackerCompile",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup,
  pattern = "*/lua/plugins/init.lua",
  command = "source <afile> | PackerClean",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup,
  pattern = "*/lua/plugins/init.lua",
  command = "source <afile> | PackerInstall",
})
