local M = {}

M.context_commentstring = function()
  local ts_config = require "nvim-treesitter.configs"
  ts_config.setup {
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }
end

M.autotag = function()
  local ts_config = require "nvim-treesitter.configs"
  ts_config.setup {
    autotag = {
      enable = true,
    },
  }
end

return M
