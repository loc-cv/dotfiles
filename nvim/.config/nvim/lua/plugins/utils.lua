---@diagnostic disable: redundant-parameter, different-requires

return {
  { "nvim-lua/plenary.nvim", lazy = true },

  { "svban/YankAssassin.vim", event = "VeryLazy" },

  {
    "machakann/vim-highlightedyank",
    event = "VeryLazy",
    init = function()
      vim.g.highlightedyank_highlight_duration = 300
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
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

  {
    "lambdalisue/suda.vim",
    cmd = { "SudaRead", "SudaWrite" },
  },

  {
    "declancm/cinnamon.nvim",
    event = "VeryLazy",
    opts = {
      always_scroll = true,
      centered = true,
      default_delay = 2,
    },
    config = function(_, opts)
      require("cinnamon").setup(opts)
    end,
  },

  -- { "jeffkreeftmeijer/vim-numbertoggle" },
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

  { "tpope/vim-sleuth" },
  { "tpope/vim-abolish", event = "VeryLazy" },
  { "tpope/vim-unimpaired", event = "VeryLazy" },
  { "tpope/vim-eunuch", event = "VeryLazy" },
}
