return {
  -- lua functions for other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- smart relative number toggle
  { "cpea2506/relative-toggle.nvim" },

  -- don't let the cursor move while yanking
  { "svban/YankAssassin.vim", event = "VeryLazy" },

  -- highlight yank
  {
    "machakann/vim-highlightedyank",
    event = "VeryLazy",
    init = function()
      vim.g.highlightedyank_highlight_duration = 300
    end,
  },

  -- better whitespace highlighting
  {
    "ntpeters/vim-better-whitespace",
    init = function()
      vim.g.better_whitespace_filetypes_blacklist = {
        "toggleterm",
        "diff",
        "git",
        "gitcommit",
        "unite",
        "qf",
        "help",
        "markdown",
        "fugitive",
      }
    end,
  },

  -- automatically close inactive buffers
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },

  -- range, pattern and substitute preview
  {
    "markonm/traces.vim",
    event = "VeryLazy",
    init = function()
      vim.g.traces_abolish_integration = 1
    end,
  },

  -- smooth scrolling
  {
    "declancm/cinnamon.nvim",
    opts = {
      default_delay = 2,
    },
    config = function(_, opts)
      require("cinnamon").setup(opts)
    end,
  },

  -- move lines and selections up and down
  {
    "echasnovski/mini.move",
    config = true,
    event = "VeryLazy",
    version = false,
  },
}
