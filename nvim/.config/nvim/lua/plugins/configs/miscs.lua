local M = {}

M.context_commentstring = function()
  local _, ts_config = pcall(require, "nvim-treesitter.configs")
  ts_config.setup {
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
  }
end

M.autotag = function()
  local _, ts_config = pcall(require, "nvim-treesitter.configs")
  ts_config.setup {
    autotag = {
      enable = true,
    },
  }
end

return M
