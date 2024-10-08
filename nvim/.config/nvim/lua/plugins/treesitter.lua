return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/nvim-treesitter-context",
      "yioneko/nvim-yati",
    },
    opts = {
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "go",
        "css",
        "scss",
        "jsdoc",
        "json",
        "jsonc",
        "markdown",
        "c_sharp",
        "ruby",
        "vue",
        "c",
        "cpp",
        "terraform",
        "python",
        "kdl",
        "yaml",
        "graphql",
        "vim",
        "vimdoc",
        "http",
      },

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = false,
      },

      -- 'nvim-treesitter/nvim-treesitter-textobjects'
      textobjects = {
        select = {
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },

      -- 'yioneko/nvim-yati'
      yati = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    config = true,
  },
}
