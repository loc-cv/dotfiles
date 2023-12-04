return {
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  {
    "svban/YankAssassin.vim",
    event = "VeryLazy",
  },

  {
    "machakann/vim-highlightedyank",
    event = "VeryLazy",
    init = function()
      vim.g.highlightedyank_highlight_duration = 300
    end,
  },

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

  {
    "dstein64/vim-startuptime",
    cmd = { "StartupTime" },
  },

  { "cpea2506/relative-toggle.nvim" },

  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },

  {
    "markonm/traces.vim",
    event = "VeryLazy",
    init = function()
      vim.g.traces_abolish_integration = 1
    end,
  },

  {
    "declancm/maximize.nvim",
    event = "VeryLazy",
    config = true,
  },
}
