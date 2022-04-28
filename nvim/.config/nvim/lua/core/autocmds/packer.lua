-- Auto compile/clean/install plugins with packer-nvim
local augroup = vim.api.nvim_create_augroup("PackerUserConfig", { clear = true })

vim.api.nvim_create_autocmd("BufWritePost", {
  group = augroup,
  pattern = "*/lua/plugins/init.lua",
  callback = function()
    vim.cmd [[source <afile> | PackerClean]]
    vim.cmd [[source <afile> | PackerInstall]]
    vim.cmd [[source <afile> | PackerCompile]]
  end,
})
