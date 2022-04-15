-- Auto compile/clean/install plugins with packer-nvim
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost */lua/plugins/init.lua source <afile> | PackerCompile
    autocmd BufWritePost */lua/plugins/init.lua source <afile> | PackerClean
    autocmd BufWritePost */lua/plugins/init.lua source <afile> | PackerInstall
  augroup end
]]
