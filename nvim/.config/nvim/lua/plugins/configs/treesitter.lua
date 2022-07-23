local M = {}

M.setup = function()
  local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
  if not ok then
    return
  end

  treesitter.setup({
    ensure_installed = {
      'lua',
      'html',
      'css',
      'scss',
      'javascript',
      'typescript',
      'tsx',
      'json',
      'jsonc',
      'c',
      'cpp',
      'go',
      'gomod',
      'php',
      'python',
      'regex',
      'bash',
      'jsdoc',
      'dot',
      'graphql',
      'rust',
    },

    highlight = {
      enable = true,
      disable = { 'vim', 'html' },
      additional_vim_regex_highlighting = false,
    },

    indent = {
      enable = false,
    },
  })
end

return M
