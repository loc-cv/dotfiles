-- Auto compile/clean/install plugins with packer-nvim
-- Add Packer commands because we are not loading it at startup
vim.cmd [[silent! command PackerClean lua require 'plugins' require('packer').clean()]]
vim.cmd [[silent! command PackerCompile lua require 'plugins' require('packer').compile()]]
vim.cmd [[silent! command PackerInstall lua require 'plugins' require('packer').install()]]
vim.cmd [[silent! command PackerStatus lua require 'plugins' require('packer').status()]]
vim.cmd [[silent! command PackerSync lua require 'plugins' require('packer').sync()]]
vim.cmd [[silent! command PackerUpdate lua require 'plugins' require('packer').update()]]

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost lua/plugins/init.lua source <afile> | PackerCompile
    autocmd BufWritePost lua/plugins/init.lua source <afile> | PackerClean
    autocmd BufWritePost lua/plugins/init.lua source <afile> | PackerInstall
  augroup end
]]
