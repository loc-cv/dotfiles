local ts_config = require "nvim-treesitter.configs"

ts_config.setup {
  ensure_installed = {
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "json",
    "jsonc",
    "lua",
    "c",
    "cpp",
    "go",
    "gomod",
    "php",
    "python",
    "regex",
    "bash",
    "jsdoc",
    "dot",
    "graphql",
  },

  highlight = {
    enable = true,
    disable = { "vim" },
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = false,
  },
}
